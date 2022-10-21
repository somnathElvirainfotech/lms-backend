const conn = require('../config/dbconfig');
const mysql = require('mysql');
require('dotenv').config();
const csvParse = require('csv-parse').parse;
var fs = require('fs');
const { resolve } = require('path');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

class User {


    static formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        return [year, month, day].join('-');
    }

    // users Create
    static async create(data, callback) {
        try {


            // var query1 = `SELECT max(user_hr_no) as maxreg FROM users`;

            // var max = await new Promise((resolve, reject) => {
            //     conn.query(query1, (err, result) => {
            //         if (err) throw err;

            //         //console.log(result);
            //         //resolve(null);

            //         if (result[0].maxreg.length > 0) {
            //             resolve(result[0].maxreg);
            //         }
            //         else {
            //             resolve(null);
            //         }
            //     })
            // })

            // var noReg = await new Promise((resolve, reject) => {
            //     var no = 0;
            //     if (max != null) {
            //         var noArr = max.split("HR");
            //         no = Number(noArr[1]) + 1;
            //     }
            //     else {
            //         no = 1;
            //     }


            //     var aa = User.regNumberGenerate(no, 6);
            //     resolve("HR" + aa)
            // })
            //  console.log( noReg);


            const { role, date, firstname, user_hr_no, lastname, qualification_id, group_id, email, password, status, organization_unit, login_type,language_id } = data;

            let sql = `INSERT INTO users(role,user_hr_no,firstname,lastname,email,password, is_active,qualification_id,date, created_at,organization_unit,login_type,language_id) VALUES (${mysql.escape(role)},${mysql.escape(user_hr_no)},${mysql.escape(firstname)},${mysql.escape(lastname)},${mysql.escape(email)},${mysql.escape(password)},${mysql.escape(status)},${mysql.escape(qualification_id)},${mysql.escape(date)},NOW(),${mysql.escape(organization_unit)},${mysql.escape(login_type)},${mysql.escape(language_id)})`;
            console.log(sql);
            conn.query(sql, (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {

                    if (data.group_id.length > 0) {


                        var ss = '';
                        var sql3 = `INSERT INTO user_group (user_id,group_id) VALUES `;
                        for (var item of data.group_id) {
                            ss += ` (
                            ${mysql.escape(result.insertId)},
                                ${mysql.escape(Number(item))}
                            ),`;
                        }

                        sql3 = sql3 + ss;

                        sql3 = sql3.slice(0, -1);

                        console.log(sql3);

                        conn.query(sql3, (err, result) => {

                            if (err) {
                                callback(true, null)
                            } else {
                                callback(false, result)
                            }
                        })
                    } else {

                        callback(false, result)
                    }
                }
            })
        } catch (err) {
            callback(true, err)
        }
    }




    // check unique user or get single user value
    static getUser(data, callback) {
        try {
            const { column, value } = data;
            const sql = `SELECT * FROM users WHERE ${column}=${mysql.escape(value)}`;

            conn.query(sql, async (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {
                    if (result.length > 0) {
                        var sql = `SELECT user_group.*,groups.g_name FROM user_group LEFT JOIN groups on groups.id=user_group.group_id WHERE user_group.user_id=${result[0].id}`;

                        console.log(sql);
                        var groups = await new Promise((resolve, reject) => {
                            conn.query(sql, (err, result) => {
                                if (err) throw err
                                resolve(result);
                            })
                        })
                        result[0].group_details = groups

                        callback(false, result)
                    } else {

                        callback(false, result)
                    }
                }
            });
        } catch (err) {
            callback(true, err)
        }
    }


    // when user login store data
    static loginInsert(data, callback) {
        try {
            const { userId, clientIp } = data;

            let sql = `INSERT INTO login(user_id,last_signin_date,last_signin_ip,created_at) VALUES (${mysql.escape(userId)},NOW(),${mysql.escape(clientIp)},NOW())`;
            //console.log(sql)
            conn.query(sql, (error, result) => {
                if (error) {
                    callback(true, error);
                }
                else {
                    callback(false, result)
                }
            })

        } catch (err) {
            callback(true, err)
        }
    }

    static getAllUser(data, callback) {
        try {

            const sql = `SELECT users.language_id,users.login_type,users.organization_unit, users.social_link_1,users.social_link_2,users.user_hr_no,users.id,users.role,users.username,users.firstname,users.lastname,CONCAT_WS(" ",users.firstname,users.lastname) AS fullname,users.email,users.is_active,users.created_at,users.updated_at,role.name as user_type,(SELECT COUNT(login.user_id) from login WHERE login.user_id=users.id) AS login_count,(SELECT login.last_signin_date FROM login WHERE login.user_id=users.id ORDER BY login.id DESC LIMIT 1 ) AS last_sign_date,(SELECT COUNT(enrollments.id) FROM enrollments WHERE enrollments.user_id=users.id) AS course_count FROM users LEFT JOIN role ON role.id=users.role WHERE users.role !=1  ORDER BY users.id DESC`;

            conn.query(sql, async (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {


                    var arr = [];
                    for (var item of result) {
                        var sql = `SELECT (SELECT g_name from groups WHERE groups.id=user_group.group_id) as group_name,(SELECT groups.id as group_id from groups WHERE groups.id=user_group.group_id) as group_id from user_group WHERE user_id=${item.id}`;

                        var aa = await new Promise((resolve, reject) => {
                            conn.query(sql, (err, result) => {

                                var temp = '';
                                var temp_id = '';
                                for (var i of result) {
                                    console.log(i.group_name);
                                    temp += i.group_name + ",";
                                    temp_id += i.group_id + ",";
                                }
                                console.log(temp);
                                temp = temp.slice(0, -1);
                                temp_id = temp_id.slice(0, -1);
                                var data = {
                                    temp: temp,
                                    temp_id: temp_id
                                }
                                resolve(data);
                            })
                        })


                        item.group_name = aa.temp;
                        item.group_id = aa.temp_id
                        arr.push(item);


                    }

                    console.log("all csv data", arr);
                    callback(false, arr)


                }
            });
        } catch (err) {
            callback(true, err)
        }
    }

    static statusActiveInactive(data, callback) {
        var sql = `UPDATE users SET is_active=${mysql.escape(data.status)} WHERE email=${mysql.escape(data.email)}`;
        console.log(sql);
        conn.query(sql, (err, result) => {
            if (err) {
                callback(true, err)
            }
            else {
                callback(false, result);
            }
        })
    }

    static updateColumnByEmail(data, email, callback) {
        const sql = `UPDATE users SET updated_at=NOW(),? WHERE email=?`;
        conn.query(sql, [data, email], (err, result) => {
            if (err) {
                callback(true, err)
            }
            else {
                callback(false, result)
            }
        })
    }


    // by email 
    static getUserProfile(data, callback) {
        try {

            const sql1 = `SELECT * FROM users WHERE email=${mysql.escape(data)}`;

            conn.query(sql1, (err, result) => {

                if (err) {
                    callback(true, err)
                }
                else {

                    if (result.length > 0) {

                        const sql2 = `SELECT COUNT(id) as sign_in_count FROM login WHERE user_id=${result[0].id}`;

                        conn.query(sql2, async (err2, result2) => {
                            if (result2.length > 0) {

                                const data = {
                                    id: result[0].id,
                                    group_id: result[0].group_id,
                                    image: result[0].image != null ? process.env.images_path + `${result[0].image}` : "",
                                    date: result[0].date,
                                    username: result[0].username,
                                    firstname: result[0].firstname,
                                    lastname: result[0].lastname,
                                    details: result[0].details,
                                    role:result[0].role,
                                    email: result[0].email,
                                    organization_id: result[0].organization_id,
                                    sign_in_count: result2[0].sign_in_count,
                                    courses_count: result[0].courses_count,
                                    enrollment_count: result[0].enrollment_count,
                                    comment_count: result[0].comment_count,
                                    user_lesson_count: result[0].user_lesson_count,
                                    social_link_1: result[0].social_link_1,
                                    social_link_2: result[0].social_link_2,
                                    is_active: result[0].is_active,
                                    created_at: result[0].created_at,
                                    updated_at: result[0].updated_at,
                                    qualification_id: result[0].qualification_id,
                                    language_id: result[0].language_id,
                                    login_type: result[0].login_type
                                };

                                var sql = `SELECT user_group.*,groups.g_name FROM user_group LEFT JOIN groups on groups.id=user_group.group_id WHERE user_group.user_id=${result[0].id}`;

                                console.log(sql);
                                var groups = await new Promise((resolve, reject) => {
                                    conn.query(sql, (err, result) => {
                                        if (err) throw err
                                        resolve(result);
                                    })
                                })

                                data.group_details = groups

                                console.log("object", data);

                                callback(false, data)

                            } else {

                                callback(true, err2)

                            }
                        })
                    } else {
                        callback(true, null)
                    }
                }
            });
        } catch (err) {
            callback(true, err)
        }
    }

    // by user id
    static getUserProfile2(id, callback) {
        try {

            const sql1 = `SELECT * FROM users WHERE id=${mysql.escape(id)}`;

            conn.query(sql1, (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {

                    if (result.length > 0) {
                        const sql2 = `SELECT COUNT(id) as sign_in_count FROM login WHERE user_id=${result[0].id}`;

                        conn.query(sql2, async (err2, result2) => {
                            if (err2) {
                                callback(true, err2)
                            } else {

                                const data = {
                                    id: result[0].id,
                                    role: result[0].role,
                                    group_id: result[0].group_id,
                                    group_details: [],
                                    image: result[0].image != null ? process.env.images_path + `${result[0].image}` : "",
                                    date: result[0].date,
                                    username: result[0].username,
                                    firstname: result[0].firstname,
                                    lastname: result[0].lastname,
                                    details: result[0].details,
                                    email: result[0].email,
                                    organization_id: result[0].organization_id,
                                    sign_in_count: result2[0].sign_in_count,
                                    courses_count: result[0].courses_count,
                                    enrollment_count: result[0].enrollment_count,
                                    comment_count: result[0].comment_count,
                                    user_lesson_count: result[0].user_lesson_count,
                                    social_link_1: result[0].social_link_1,
                                    social_link_2: result[0].social_link_2,
                                    is_active: result[0].is_active,
                                    created_at: result[0].created_at,
                                    updated_at: result[0].updated_at,
                                    qualification_id: result[0].qualification_id,
                                    language_id: result[0].language_id,
                                    user_hr_no: result[0].user_hr_no,
                                    date: User.formatDate(result[0].date),
                                    organization_unit: result[0].organization_unit,
                                    login_type: result[0].login_type
                                };

                                var sql = `SELECT user_group.*,groups.g_name FROM user_group LEFT JOIN groups on groups.id=user_group.group_id WHERE user_group.user_id=${data.id}`;

                                console.log(sql);
                                var groups = await new Promise((resolve, reject) => {
                                    conn.query(sql, (err, result) => {
                                        if (err) throw err
                                        resolve(result);
                                    })
                                })
                                data.group_details = groups

                                callback(false, data)
                            }
                        })
                    }
                }
            });
        } catch (err) {
            callback(true, err)
        }
    }


    //update cretor/user
    static updateUser(data, email, callback) {

        const sql = `update users set updated_at=NOW(),? where email=?`;

        conn.query(sql, [data, email], (err, result) => {
            if (err) {
                callback(true, err)
            }
            else {
                callback(false, result);
            }
        })

    }

    // update by user id
    static async updateUserById(data, id, group_arr, callback) {



        const sql = `update users set updated_at=NOW(),? where id=?`;

        conn.query(sql, [data, id], async (err, result) => {
            console.log(err)
            if (err) {
                callback(true, err)
            }
            else {

                var dsql = `DELETE FROM user_group WHERE user_id=${mysql.escape(id)}`;
                var d_status = await new Promise((resolve, reject) => {
                    conn.query(dsql, (err, result) => {
                        if (err) {
                            resolve(false)
                        } else {
                            resolve(true)
                        }
                    })
                })

                if (d_status) {
                    var ss = '';
                    var sql3 = `INSERT INTO user_group (user_id,group_id) VALUES `;
                    for (var item of group_arr) {
                        ss += ` (
                 ${mysql.escape(id)},
                    ${mysql.escape(Number(item))}
                ),`;
                    }

                    sql3 = sql3 + ss;

                    sql3 = sql3.slice(0, -1);

                    // console.log(sql3);

                    conn.query(sql3, (err, result) => {

                        if (err) {
                            callback(true, null)
                        } else {
                            callback(false, result)
                        }
                    })
                }

                // callback(false, result);
            }
        })

    }

    static regNumberGenerate(num, size) {
        var s = num + "";
        while (s.length < size) s = "0" + s;
        return s;
    }

    // password change
    static passwordChange(data, email, callback) {
        var sql = `UPDATE users set updated_at=NOW(),? where email=?`;

        // console.log(sql)

        conn.query(sql, [data, email], (err, result) => {
            if (err) {
                callback(true, err);
            }
            else {
                callback(false, result);
            }
        })
    }

    // bulk create with csv
    static async userCsvUpload(name, callback) {
        try {
            var result = await new Promise(function (resolve, reject) {
                var Csvdata = [];
                fs.createReadStream('uploads/csvfolder/' + name)
                    .pipe(csvParse({
                        comment: "#",
                        columns: true,
                    }))
                    .on('data', (data) => Csvdata.push(data))
                    .on('end', () => {
                        //console.log(result)
                        resolve(Csvdata)
                    });

            })


            //console.log(result)

            for (let item of result) {


                var chkUser = await new Promise((resolve, reject) => {

                    const sql1 = `SELECT * FROM users WHERE email=${mysql.escape(item.email)}`;
                    conn.query(sql1, (err, result) => {
                        if (err) throw err;

                        if (result.length > 0) {
                            resolve(true);
                        }
                        else {
                            resolve(false);
                        }
                    })


                })



                var userDetails = await new Promise((resolve, reject) => {

                    const sql1 = `SELECT * FROM users WHERE email=${mysql.escape(item.email)}`;
                    conn.query(sql1, (err, result) => {
                        if (err) throw err;

                        if (result.length > 0) {
                            resolve(result[0]);
                        }
                        else {
                            resolve([]);
                        }
                    })


                })


                if (chkUser) {
                    const sql = `update users set updated_at=NOW(),? where email=?`;

                    const status = item.is_active ? item.is_active : 0;
                    let userData = {
                        firstname: item.firstname,
                        lastname: item.lastname,
                        role: item.role,
                        is_active: status,
                        social_link_1: item.social_link_1,
                        social_link_2: item.social_link_2,
                        details: item.details,
                        user_hr_no: item.user_hr_no,
                        login_type: item.login_type,
                        language_id:item.language_id,
                    };

                    console.log("password  ", item.password);

                    if (item.password) {

                        const salt = await bcrypt.genSalt(12);
                        const hashPassword = await bcrypt.hash(item.password, salt);
                        userData.password = hashPassword;
                    }

                    console.log(userData);

                    conn.query(sql, [userData, item.email], async (err, result) => {
                        if (err) throw err;

                        var dsql = `DELETE FROM user_group WHERE user_id=${mysql.escape(userDetails.id)}`;
                        var d_status = await new Promise((resolve, reject) => {
                            conn.query(dsql, (err, result) => {
                                if (err) {
                                    resolve(false)
                                } else {
                                    resolve(true)
                                }
                            })
                        })

                        if (d_status) {
                            var group_arr = item.group_id.split(",");
                            var grouparr = group_arr.map(i => Number(i));
                            var ss = '';
                            var sql3 = `INSERT INTO user_group (user_id,group_id) VALUES `;
                            for (var itemd of grouparr) {
                                ss += ` (
                            ${mysql.escape(userDetails.id)},
                                ${mysql.escape(Number(itemd))}
                            ),`;
                            }

                            sql3 = sql3 + ss;

                            sql3 = sql3.slice(0, -1);

                            // console.log(sql3);

                            conn.query(sql3, (err, result) => {
                                if (err) throw err;
                            })
                        }
                    })
                }
                else {
                    
                    const salt = await bcrypt.genSalt(12);
                    const hashPassword = await bcrypt.hash(item.password, salt);

                    const status = item.is_active ? item.is_active : 0;
                    const sql = `INSERT INTO users(role,user_hr_no,firstname,lastname,email,password, is_active, created_at,social_link_1,social_link_2,login_type,language_id) VALUES (${mysql.escape(item.role)},${mysql.escape(item.user_hr_no)},${mysql.escape(item.firstname)},${mysql.escape(item.lastname)},${mysql.escape(item.email)},${mysql.escape(hashPassword)},${mysql.escape(status)},NOW(),${mysql.escape(item.social_link_1)},${mysql.escape(item.social_link_2)},${mysql.escape(item.login_type)},${mysql.escape(item.language_id)})`;

                    console.log(sql)

                    conn.query(sql, async (err, result) => {
                        if (err) throw err;

                        var group_arr = item.group_id.split(",");
                        var grouparr = group_arr.map(i => Number(i));
                        var ss = '';
                        var sql3 = `INSERT INTO user_group (user_id,group_id) VALUES `;
                        for (var itemd of grouparr) {
                            ss += ` (
                            ${mysql.escape(result.insertId)},
                                ${mysql.escape(Number(itemd))}
                            ),`;
                        }

                        sql3 = sql3 + ss;

                        sql3 = sql3.slice(0, -1);

                        console.log(sql3);

                        conn.query(sql3, (err, result) => {
                            if (err) throw err;
                        })
                    })

                }

                //console.log(chkUser)
            }


            // after delete file
            fs.unlink('uploads/csvfolder/' + name, (err) => {
                if (err) throw err;

                console.log("file delete");
            })


            callback(false, "ok")
        } catch (err) {
            console.log(err)
        }



    }

    static countCourseCertificate(id, callback) {
        var sql = `SELECT COUNT(enrollments.id) as enroll_count,(SELECT count(id) FROM enrollments WHERE enrollments.user_id=users.id AND enrollments.enrollment_status='completed') as complete_course_count FROM users LEFT JOIN enrollments ON enrollments.user_id=users.id WHERE users.id=?`;
        conn.query(sql, id, (err, result) => {
            if (err) throw err;

            if (result.length > 0) {
                callback(false, result)
            }
            else {
                callback(true, null)
            }
        })

    }

    static getUserByRoleId(id, callback) {
        var sql = `SELECT * FROM users WHERE role=${mysql.escape(id)} AND is_active=1`;
        conn.query(sql, (err, result) => {
            if (err) throw err;

            if (result.length > 0) {
                callback(false, result)
            } else {
                callback(true, null)
            }
        })
    }

    static userSearch(data, callback) {

        var hr_number = data.hr_number;
        var email = data.email;
        var name = data.name;

        var sql = `SELECT * FROM (SELECT users.login_type,users.group_id,users.social_link_1,users.social_link_2,users.user_hr_no,users.id,users.role,users.username,users.firstname,users.lastname,CONCAT_WS(" ",users.firstname,users.lastname) AS fullname,users.email,users.is_active,users.created_at,users.updated_at,role.name as user_type,(SELECT COUNT(login.user_id) from login WHERE login.user_id=users.id) AS login_count,(SELECT login.last_signin_date FROM login WHERE login.user_id=users.id ORDER BY login.id DESC LIMIT 1 ) AS last_sign_date,(SELECT COUNT(enrollments.id) FROM enrollments WHERE enrollments.user_id=users.id) AS course_count,(SELECT g_name FROM groups WHERE groups.id=users.group_id) AS group_name FROM users LEFT JOIN role ON role.id=users.role WHERE users.role !=1  ORDER BY users.id DESC)p  `;

        if (hr_number || email || name) {
            sql += ` where `;
        }

        if (email) {
            sql += ` email=${mysql.escape(email)} `;

            if (hr_number) {
                sql += ` OR user_hr_no=${mysql.escape(hr_number)} `;
            }

            if (name) {
                sql += ` OR fullname LIKE '%${name}%' `;
            }

        }
        else if (hr_number) {
            sql += ` user_hr_no=${mysql.escape(hr_number)} `;

            if (name) {
                sql += ` OR fullname LIKE '%${name}%' `;
            }
        }
        else if (name) {

            sql += ` fullname LIKE '%${name}%' `;
        }

        sql += ` ORDER by id DESC`;


        console.log(sql);
        conn.query(sql, (err, result) => {
            if (err) throw err;

            if (result.length > 0) {
                callback(false, result)
            } else {
                callback(true, result)
            }
        })
    }


}

module.exports = User;