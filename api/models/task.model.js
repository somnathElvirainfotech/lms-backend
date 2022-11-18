var mysql = require('mysql');
var conn = require('../config/dbconfig');
require("dotenv").config();

class Task {

    formatDate(date) {
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


    async create(data, callback) {

        var sql1 = `SELECT * FROM users WHERE id=${mysql.escape(data.created_by)}`;

        var task_status = await new Promise((resolve, reject) => {
            conn.query(sql1, (err, result) => {
                if (err) throw err;

                if (result[0].role == 2 || result[0].role == 1) {
                    resolve("approve")
                } else if (result[0].role == 4) {
                    resolve("pending")
                }
            })
        })


        var sql2 = `INSERT INTO task (task_describtion,task_name,created_by,task_start_date,task_end_date,course_id,task_status,created_at) VALUES (
         ${mysql.escape(data.task_describtion)},
         ${mysql.escape(data.task_name)},
         ${mysql.escape(data.created_by)},
         ${mysql.escape(data.task_start_date)},
         ${mysql.escape(data.task_end_date)},
         ${mysql.escape(data.course_id)},
         ${mysql.escape(task_status)},
         NOW()
        )`;

        //console.log(sql2);

        var taskId = await new Promise((resolve, reject) => {
            conn.query(sql2, (err, result) => {

                if (err) {

                    resolve(null)
                } else {
                    resolve(result.insertId)
                }
            })
        })

        if (taskId != null) {
            var ss = '';
            var sql3 = `INSERT INTO task_group (task_id,group_id,created_at) VALUES `;
            for (var item of data.group_id) {
                ss += ` (
                 ${mysql.escape(taskId)},
                    ${mysql.escape(Number(item))},
                    NOW()
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

    }


    show(id, callback) {
        if (id) {
            var sql = `SELECT task.*,courses.course_name,concat_ws(" ",users.firstname,users.lastname) as creator_name,users.email as creator_email FROM task LEFT JOIN courses ON courses.id=task.course_id LEFT JOIN users ON users.id=task.created_by WHERE task.id=${mysql.escape(id)}`;
            console.log(sql);
            conn.query(sql, async (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {

                    var tempArr = [];

                    for (var item of result) {
                        var temp = {
                            id: item.id,
                            created_by: item.created_by,
                            creator_name: item.creator_name,
                            creator_email: item.creator_email,
                            task_name: item.task_name,
                            task_describtion: item.task_describtion,
                            task_start_date: this.formatDate(item.task_start_date),
                            task_end_date: this.formatDate(item.task_end_date),
                            course_id: item.course_id,
                            course_name: item.course_name,
                            task_status: item.task_status,
                            created_at: item.created_at,
                            updated_at: item.updated_at,
                            groups_id: [],
                            group_details: []
                        }

                        var tsql = `SELECT task_group.*,groups.g_name from task_group LEFT JOIN groups ON groups.id=task_group.group_id WHERE task_group.task_id=${mysql.escape(item.id)}`;

                        var groups = await new Promise((resolve, reject) => {
                            conn.query(tsql, (err, result) => {
                                if (err) {
                                    resolve([])
                                } else {
                                    resolve(result)
                                }
                            })
                        })
                        /////////////////////////

                        for (var i of groups) {
                            temp.groups_id.push(i.group_id);
                        }


                        temp.group_details = groups;
                        tempArr.push(temp);
                    }
                    console.log(tempArr)
                    callback(false, tempArr);
                }
            })
        }
        else {
            var sql = `SELECT task.*,courses.course_name,concat_ws(" ",users.firstname,users.lastname) as creator_name,users.email as creator_email FROM task LEFT JOIN courses ON courses.id=task.course_id LEFT JOIN users ON users.id=task.created_by  ORDER BY task.id DESC`;

            conn.query(sql, async (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {

                    var tempArr = [];

                    for (var item of result) {
                        var temp = {
                            id: item.id,
                            created_by: item.created_by,
                            creator_name: item.creator_name,
                            creator_email: item.creator_email,
                            task_name: item.task_name,
                            task_describtionid: item.task_describtion,
                            task_start_date: item.task_start_date,
                            task_end_date: item.task_end_date,
                            course_id: item.course_id,
                            course_name: item.course_name,
                            task_status: item.task_status,
                            created_at: item.created_at,
                            updated_at: item.updated_at,
                            group_name: '',
                            group_details: []
                        }

                        var tsql = `SELECT task_group.*,groups.g_name from task_group LEFT JOIN groups ON groups.id=task_group.group_id WHERE task_group.task_id=${mysql.escape(item.id)}`;

                        var groups = await new Promise((resolve, reject) => {
                            conn.query(tsql, (err, result) => {
                                if (err) {
                                    resolve([])
                                } else {
                                    resolve(result)
                                }
                            })
                        })
                        /////////////////////////

                        for (var i of groups) {
                            temp.group_name += `${i.g_name},`;
                        }

                        temp.group_name = temp.group_name.slice(0, -1);

                        temp.group_details = groups;
                        tempArr.push(temp);
                    }
                    console.log(tempArr)
                    callback(false, tempArr);
                }
            })
        }
    }

    update(data, id, group_id, callback) {

        var sql = `UPDATE task SET updated_at=NOW(), ? WHERE id=?`;

        conn.query(sql, [data, id], async (err, result) => {
            if (err) {
                callback(true, err)
            }
            else {

                if (group_id) {
                    var dsql = `DELETE FROM task_group WHERE task_id=${mysql.escape(id)}`;
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
                        var sql3 = `INSERT INTO task_group (task_id,group_id,created_at) VALUES `;
                        for (var item of group_id) {
                            ss += ` (
                 ${mysql.escape(id)},
                    ${mysql.escape(Number(item))},
                    NOW()
                ),`;
                        }

                        sql3 = sql3 + ss;

                        sql3 = sql3.slice(0, -1);

                        // console.log(sql3);

                        conn.query(sql3, (err, result) => {

                            if (err) throw err;
                        })
                    }
                }

                callback(false, result);
            }
        })
    }

    delete(id, callback) {
        var sql = `DELETE FROM task WHERE id=?`;
        conn.query(sql, id, (err, result) => {
            if (err) {
                callback(true, err)
            }
            else {

                var sql2 = `DELETE FROM task_group where task_id=?`;

                conn.query(sql2, id, (err, result) => {
                    if (err) throw err;
                })

                callback(false, result);
            }
        })
    }


    // show by group id
    taskSearch(data, callback) {
        var sql = `SELECT task.*,concat_ws(" ",users.firstname,users.lastname) as creator_name,users.email AS creator_email,courses.course_name,courses.image FROM task LEFT JOIN task_group ON task_group.task_id=task.id LEFT JOIN users ON users.id=task.created_by LEFT JOIN courses ON courses.id=task.course_id WHERE `;
        if (data.group_id) {
            sql += ` task_group.group_id IN (${data.group_id}) `;
            if (data.created_by) {
                sql += ` AND task.created_by=${mysql.escape(data.created_by)} `;
            }

            if (data.course_id) {
                sql += ` AND task.course_id=${mysql.escape(data.course_id)} `;
            }


        }
        else if (data.created_by) {
            sql += ` task.created_by=${mysql.escape(data.created_by)} `;

            if (data.course_id) {
                sql += ` AND task.course_id=${mysql.escape(data.course_id)} `;
            }
        }
        else if (data.course_id) {

            sql += ` task.course_id=${mysql.escape(data.course_id)} `;

        }



        if (data.group_id || data.course_id || data.created_by) {
            sql += `  GROUP BY task.id order by task.id desc`;
        } else {
            sql = `SELECT task.*,courses.course_name,courses.image,concat_ws(" ",users.firstname,users.lastname) as creator_name,users.email as creator_email FROM task LEFT JOIN courses ON courses.id=task.course_id LEFT JOIN users ON users.id=task.created_by GROUP BY task.id  ORDER BY task.id DESC `;
        }



        console.log(sql)

        conn.query(sql, async (err, result) => {
            if (err) {
                callback(true, null)
            } else {

                var tempArr = [];

                for (var item of result) {
                    var temp = {
                        id: item.id,
                        created_by: item.created_by,
                        creator_name: item.creator_name,
                        creator_email: item.creator_email,
                        task_name: item.task_name,
                        task_describtion: item.task_describtion,
                        task_start_date: item.task_start_date,
                        task_end_date: item.task_end_date,
                        course_id: item.course_id,
                        course_name: item.course_name,
                        course_image: item.image != null
                        ? process.env.images_path + `${item.image}`
                        : "",
                        task_status: item.task_status,
                        created_at: item.created_at,
                        updated_at: item.updated_at,
                        group_name: '',
                        group_details: [],
                        no_attempted: 0,
                        user_task_status: ""
                    }

                    var sqlw = `SELECT * FROM user_task where user_id=${mysql.escape(data.user_id)} and task_id=${mysql.escape(item.id)}`;


                    var userTask = await new Promise((resolve, reject) => {
                        conn.query(sqlw, (err, result) => {
                            if (err) throw err;

                            if (result.length > 0) {
                                resolve(result)
                            } else {
                                resolve([])
                            }
                        })
                    })

                    if (userTask.length>0) {
                        temp.no_attempted = userTask[0].no_attempted;
                        temp.user_task_status = userTask[0].user_task_status;
                    }else{
                        
                        temp.user_task_status = "No Attempted";
                    }

                    if (data.group_id) {
                        var tsql = `SELECT task_group.*,groups.g_name from task_group LEFT JOIN groups ON groups.id=task_group.group_id WHERE task_group.task_id=${mysql.escape(item.id)} AND task_group.group_id IN (${data.group_id})`;
                    } else {
                        var tsql = `SELECT task_group.*,groups.g_name from task_group LEFT JOIN groups ON groups.id=task_group.group_id WHERE task_group.task_id=${mysql.escape(item.id)} `;
                    }

                    var groups = await new Promise((resolve, reject) => {
                        conn.query(tsql, (err, result) => {
                            if (err) {
                                resolve([])
                            } else {
                                resolve(result)
                            }
                        })
                    })
                    /////////////////////////

                    for (var i of groups) {
                        temp.group_name += `${i.g_name},`;
                    }

                    temp.group_name = temp.group_name.slice(0, -1);

                    temp.group_details = groups;
                    tempArr.push(temp);
                }
                
                console.log("sssssssssssssssss",tempArr)
                callback(false, tempArr)
            }
        })

    }


}

module.exports = new Task();