const conn = require('../config/dbconfig');
const mysql = require('mysql');

class ratingComment {

    async create(data, callback) {


        var sql1 = `SELECT * FROM course_comments WHERE course_id=${mysql.escape(data.course_id)} AND user_id=${mysql.escape(data.user_id)}`;

        var commentStatus = await new Promise((resolve, reject) => {
            conn.query(sql1, (err, result) => {
                console.log(result);
                if (result.length > 0) {
                    resolve(false)
                } else {
                    resolve(true)
                }
            })
        })

        // console.log(commentStatus);
        if (commentStatus) {
            var sql = `INSERT INTO course_comments(date_at, user_id,course_id,rating_number,comment,created_at) VALUES (
                "${new Date().toISOString().slice(0, 10)}",
                ${mysql.escape(data.user_id)},
                ${mysql.escape(data.course_id)},
                ${mysql.escape(data.rating_number)},
                ${mysql.escape(data.comment)},
                NOW())`;
            console.log(sql)
            conn.query(sql, (err, result) => {
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

    async taskCreate(data, callback) {


        var sql1 = `SELECT * FROM course_comments WHERE task_id=${mysql.escape(data.task_id)} AND user_id=${mysql.escape(data.user_id)}`;

        var commentStatus = await new Promise((resolve, reject) => {
            conn.query(sql1, (err, result) => {
                console.log(result);
                if (result.length > 0) {
                    resolve(false)
                } else {
                    resolve(true)
                }
            })
        })

        // console.log(commentStatus);
        if (commentStatus) {
            var sql = `INSERT INTO course_comments(date_at, user_id,task_id,rating_number,comment,created_at) VALUES (
                "${new Date().toISOString().slice(0, 10)}",
                ${mysql.escape(data.user_id)},
                ${mysql.escape(data.task_id)},
                ${mysql.escape(data.rating_number)},
                ${mysql.escape(data.comment)},
                NOW())`;
            console.log(sql)
            conn.query(sql, (err, result) => {
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

    // by course
    async show(data, callback) {
        if (data.course_id && data.user_id) {
            var sql = '';

            if (data.limit) {
                sql = `SELECT course_comments.*,CONCAT_WS(" ",u.firstname,u.lastname) AS fullname ,c.course_name FROM course_comments LEFT JOIN users AS u ON u.id=course_comments.user_id LEFT JOIN courses AS c ON c.id=course_comments.course_id WHERE course_comments.course_id=${data.course_id} AND course_comments.user_id=${data.user_id} ORDER BY course_comments.id DESC LIMIT ${data.limit}`;
            } else {
                sql = `SELECT course_comments.*,CONCAT_WS(" ",u.firstname,u.lastname) AS fullname ,c.course_name FROM course_comments LEFT JOIN users AS u ON u.id=course_comments.user_id LEFT JOIN courses AS c ON c.id=course_comments.course_id WHERE course_comments.course_id=${data.course_id} AND course_comments.user_id=${data.user_id} ORDER BY course_comments.id DESC `;
            }
            console.log(sql);
            conn.query(sql, (err, result) => {
                if (err) {
                    callback(true, null)
                } else {
                    callback(false, result)
                }
            })
        }
        else if (data.course_id) {

            var sql = '';

            if (data.limit) {
                sql = `SELECT course_comments.*,CONCAT_WS(" ",u.firstname,u.lastname) AS fullname ,c.course_name FROM course_comments LEFT JOIN users AS u ON u.id=course_comments.user_id LEFT JOIN courses AS c ON c.id=course_comments.course_id WHERE course_comments.course_id=${data.course_id} ORDER BY course_comments.id DESC LIMIT ${data.limit}`;
            } else {
                sql = `SELECT course_comments.*,CONCAT_WS(" ",u.firstname,u.lastname) AS fullname ,c.course_name FROM course_comments LEFT JOIN users AS u ON u.id=course_comments.user_id LEFT JOIN courses AS c ON c.id=course_comments.course_id WHERE course_comments.course_id=${data.course_id} ORDER BY course_comments.id DESC `;
            }
            console.log(sql);
            conn.query(sql, (err, result) => {
                if (err) {
                    callback(true, null)
                } else {
                    callback(false, result)
                }
            })

        }
        else if (data.user_id) {
            var sql = '';

            if (data.limit) {
                sql = `SELECT course_comments.*,CONCAT_WS(" ",u.firstname,u.lastname) AS fullname ,c.course_name FROM course_comments LEFT JOIN users AS u ON u.id=course_comments.user_id LEFT JOIN courses AS c ON c.id=course_comments.course_id WHERE course_comments.user_id=${data.user_id} ORDER BY course_comments.id DESC LIMIT ${data.limit}`;
            } else {
                sql = `SELECT course_comments.*,CONCAT_WS(" ",u.firstname,u.lastname) AS fullname ,c.course_name FROM course_comments LEFT JOIN users AS u ON u.id=course_comments.user_id LEFT JOIN courses AS c ON c.id=course_comments.course_id WHERE course_comments.user_id=${data.user_id} ORDER BY course_comments.id DESC `;
            }
            console.log(sql);
            conn.query(sql, (err, result) => {
                if (err) {
                    callback(true, null)
                } else {
                    callback(false, result)
                }
            })
        }
        else {
            var sql = `SELECT course_comments.*,CONCAT_WS(" ",u.firstname,u.lastname) AS fullname,c.course_name FROM course_comments LEFT JOIN users AS u ON u.id=course_comments.user_id LEFT JOIN courses AS c ON c.id=course_comments.course_id ORDER BY course_comments.id DESC`;

            conn.query(sql, (err, result) => {
                if (err) {
                    callback(true, null)
                } else {
                    callback(false, result)
                }
            })
        }
    }


    // by task 
    async showTask(data, callback) {
        if (data.task_id) {

            var sql = '';

            if (data.limit) {
                sql = `SELECT course_comments.*,CONCAT_WS(" ",u.firstname,u.lastname) AS fullname ,t.task_name FROM course_comments LEFT JOIN users AS u ON u.id=course_comments.user_id LEFT JOIN task AS t ON t.id=course_comments.task_id WHERE course_comments.task_id=${data.task_id} ORDER BY course_comments.id DESC LIMIT ${data.limit}`;
            } else {
                sql = `SELECT course_comments.*,CONCAT_WS(" ",u.firstname,u.lastname) AS fullname ,t.task_name FROM course_comments LEFT JOIN users AS u ON u.id=course_comments.user_id LEFT JOIN task AS t ON t.id=course_comments.task_id WHERE course_comments.task_id=${data.task_id} ORDER BY course_comments.id DESC `;
            }
            console.log(sql);
            conn.query(sql, (err, result) => {
                if (err) {
                    callback(true, null)
                } else {
                    callback(false, result)
                }
            })

        } else {
            var sql = `SELECT course_comments.*,CONCAT_WS(" ",u.firstname,u.lastname) AS fullname,t.task_name FROM course_comments LEFT JOIN users AS u ON u.id=course_comments.user_id LEFT JOIN task AS t ON t.id=course_comments.task_id ORDER BY course_comments.id DESC`;

            conn.query(sql, (err, result) => {
                if (err) {
                    callback(true, null)
                } else {
                    callback(false, result)
                }
            })
        }
    }

    // by course id
    async chkComment(data, callback) {
        var sql1 = `SELECT * FROM course_comments WHERE course_id=${mysql.escape(data.course_id)} AND user_id=${mysql.escape(data.user_id)}`;


        var commentStatus = await new Promise((resolve, reject) => {
            conn.query(sql1, (err, result) => {
                console.log(result);
                if (result.length > 0) {
                    resolve(false)
                } else {
                    resolve(true)
                }
            })
        })

        if (commentStatus) {
            callback(false, commentStatus)
        } else {
            callback(true, commentStatus)
        }
    }

    // by task id
    async chkCommentTask(data, callback) {
        var sql1 = `SELECT * FROM course_comments WHERE task_id=${mysql.escape(data.task_id)} AND user_id=${mysql.escape(data.user_id)}`;


        var commentStatus = await new Promise((resolve, reject) => {
            conn.query(sql1, (err, result) => {
                console.log(result);
                if (result.length > 0) {
                    resolve(false)
                } else {
                    resolve(true)
                }
            })
        })

        if (commentStatus) {
            callback(false, commentStatus)
        } else {
            callback(true, commentStatus)
        }
    }

    async delete(id, callback) {
        var sql = `DELETE FROM course_comments WHERE id=${mysql.escape(id)}`;

        conn.query(sql, (err, result) => {
            if (err) throw err;
            callback(false, null)
        })
    }

    update(data, id, callback) {
        var sql = `UPDATE course_comments SET updated_at=NOW(), ? WHERE id=?`;

        conn.query(sql, [data, id], (err, result) => {
            console.log(err);
            if (err) {
                callback(true, err)
            }
            else {
                callback(false, result);
            }
        })
    }


}

module.exports = new ratingComment();