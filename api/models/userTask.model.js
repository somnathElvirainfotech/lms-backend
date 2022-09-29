var mysql = require('mysql');
var conn = require('../config/dbconfig');

class userTask {


    async updateCreate(data,callback) {


        var sql = `select * from user_task WHERE user_id=${mysql.escape(data.user_id)} and task_id=${mysql.escape(data.task_id)}`;

        var chek = await new Promise((resolve, reject) => {
            conn.query(sql, (err, result) => {
                if (err) throw err;

                if (result.length > 0) {
                    resolve(true)
                } else {
                    resolve(false)
                }
            })
        })

        if (chek) {
            var sql = `UPDATE user_task set no_attempted=${mysql.escape(data.no_attempted)},updated_at=NOW() WHERE user_id=${mysql.escape(data.user_id)} and task_id=${mysql.escape(data.task_id)}`;

            await new Promise((resolve, reject) => {
                conn.query(sql, (err, result) => {
                    if (err) throw err;
                    resolve(true)
                })
            })

        } else {
            var sql = `INSERT INTO user_task(task_id, user_id, no_attempted, created_at) VALUES(${mysql.escape(data.task_id)},
            ${mysql.escape(data.user_id)},
            ${mysql.escape(data.no_attempted)},
            NOW()
            )`;

            await new Promise((resolve, reject) => {
                conn.query(sql, (err, result) => {
                    if (err) throw err;
                    resolve(true)
                })
            })
        }

        callback(false, null)

    }


}

module.exports = new userTask();