const conn = require('../config/dbconfig');
const mysql = require('mysql');
const e = require('connect-flash');

class Assignment {

    static create(data, callback) {
        var sql = `INSERT INTO assignments(assignment_name,user_group_id,user_id,course_id,assigment_file,assigment_desc,assigment_duration, created_at) VALUES 
        (
            ${mysql.escape(data.assignment_name)},
            ${mysql.escape(data.user_group_id)},
            ${mysql.escape(data.user_id)},
        ${mysql.escape(data.course_id)},
        ${mysql.escape(data.assigment_file)},
        ${mysql.escape(data.assigment_desc)},
        ${mysql.escape(data.assigment_duration)},
        NOW())`;
        // console.log(sql)
        conn.query(sql, (err, result) => {
            if (err) {
                callback(true, err)
            }
            else {
                callback(false, result);
            }
        })
    }

    static show(id, callback) {
        if (id) {
            var sql = `SELECT * FROM assignments WHERE id=?`;
            conn.query(sql, id, (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {
                    callback(false, result);
                }
            })
        }
        else {
            var sql = `SELECT assignments.*,c.course_name,c.approved_status,c.published_status,groups.g_name,users.email,users.firstname,users.lastname FROM assignments 
            LEFT JOIN courses c ON c.id=assignments.course_id LEFT JOIN groups ON groups.id=assignments.user_group_id LEFT JOIN users ON users.id=assignments.user_id ORDER BY assignments.id DESC`;
            conn.query(sql, (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {
                    callback(false, result);
                }
            })
        }
    }

    static update(data, id, callback) {
        var sql = `UPDATE assignments SET updated_at=NOW(), ? WHERE id=?`;

        conn.query(sql, [data, id], (err, result) => {
            if (err) {
                callback(true, err)
            }
            else {
                callback(false, result);
            }
        })
    }

    static async delete(id, callback) {

        var sql = `SELECT * FROM assignments WHERE id=${id}`;

        var course_id = await new Promise((resolve, reject) => {
            conn.query(sql, (err, result) => {
                if (err) throw err;

                if (result.length > 0) {
                    resolve(result[0].course_id)
                } else {
                    resolve(null)
                }
            })
        })


        var sql1 = `SELECT * FROM enrollments WHERE course_id=${course_id}`;

        var enroll = await new Promise((resolve, reject) => {
            conn.query(sql1, (err, result) => {
                if (err) throw err;

                if (result.length > 0) {
                    resolve(true)
                } else {
                    resolve(false)
                }
            })
        })




        if (!enroll) {
            var sql2 = `DELETE FROM assignments WHERE id=?`;
            conn.query(sql2, id, (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {
                    callback(false, "delete sucessfull");
                }
            })
        }
        else {
            callback(true, "course allready enroll, so assignment can't delete")
        }
    }

    static async getByCourseId(course_id, user_id, callback) {


        var sql = `SELECT * from users WHERE id=${user_id}`;

        var chk_role = await new Promise((resolve, reject) => {
            conn.query(sql, (err, result) => {
                if (err) throw err;

                if (result[0].role != 5) {
                    resolve(true)
                }
                else {
                    resolve(false);
                }
            })
        })


        if (chk_role) {
            chkEnroll = true;
        } else {



            var sql1 = `SELECT * FROM enrollments WHERE course_id=${course_id} AND user_id=${user_id}`;

            var chkEnroll = await new Promise(function (resolve, reject) {

                conn.query(sql1, (err, result) => {
                    if (err) throw err;

                    if (result.length > 0) {
                        resolve(true)
                    } else {
                        resolve(false)
                    }
                })
            })
        }

        if (chkEnroll) {
            var sql = `SELECT assignments.*,c.course_name,groups.g_name,users.email,users.firstname,users.lastname FROM assignments 
            LEFT JOIN courses c ON c.id=assignments.course_id LEFT JOIN groups ON groups.id=assignments.user_group_id LEFT JOIN users ON users.id=assignments.user_id  WHERE assignments.course_id=? ORDER BY assignments.id DESC `;
            conn.query(sql, course_id, (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {
                    callback(false, result);
                }
            })
        } else {
            callback(true, null)
        }

    }

    static async getAllEnrollAssignmentByUserId(user_id, callback) {

        var sql1 = `SELECT * FROM enrollments WHERE user_id=${mysql.escape(user_id)}`;

        var enData = await new Promise(function (resolve, reject) {
            conn.query(sql1, (err, result) => {
                if (err) throw err;

                if (result.length > 0) {
                    // console.log(result)
                    resolve(result)
                }
                else {
                    resolve(null)
                }
            })
        })




        var aData = [];


        if (enData != null) {
            for (var item of enData) {
                //console.log("xxxxxxxxxxx",enData)
                for (var item of enData) {
                    var sql = `SELECT assignments.*,c.course_name,groups.g_name,users.email,users.firstname,users.lastname FROM assignments 
                LEFT JOIN courses c ON c.id=assignments.course_id LEFT JOIN groups ON groups.id=assignments.user_group_id LEFT JOIN users ON users.id=assignments.user_id  WHERE assignments.course_id=${item.course_id} ORDER BY assignments.id DESC`;

                    var assData = await new Promise(function (resolve, reject) {
                        conn.query(sql, (err, result) => {
                            if (err) throw err;

                            if (result.length > 0) {
                                resolve(result)
                            }
                            else {
                                resolve([])
                            }
                        })
                    })

                    aData.push(assData[0])

                }
                callback(false, aData);
            }
        }
        else {
            callback(true, null)
        }



        // conn.query(sql, user_id, (err, result) => {
        //     if (err) throw err;

        //     if (result.length > 0) {
        //         callback(false, result);
        //     } else {
        //         callback(true, null)
        //     }
        //})
    }
}

module.exports = Assignment;