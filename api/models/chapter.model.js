const conn = require('../config/dbconfig');
const mysql = require('mysql');

class Language {

    static async create(data, callback) {

        var chkSql = `SELECT * FROM chapters WHERE chapter_no=${mysql.escape(data.chapter_no)} AND course_id=${mysql.escape(data.course_id)}`;

        var chk = await new Promise((resolve, reject) => {
            conn.query(chkSql, (err, result) => {
                if (err) throw err;
                if (result.length > 0) {
                    resolve(false)
                } else {
                    resolve(true)
                }
            })
        })

        if (chk) {
            var sql = `INSERT INTO chapters(course_id,chapter_no,chapter_name,created_at) VALUES (${mysql.escape(data.course_id)},${mysql.escape(data.chapter_no)},${mysql.escape(data.chapter_name)},NOW())`;
            // console.log(sql)
            conn.query(sql, (err, result) => {
                if (err) {
                    callback(true, null)
                }
                else {
                    callback(false, result);
                }
            })
        } else {
            callback(true, "chapter number allready exits!")
        }


    }

    static show(id, callback) {
        if (id) {
            var sql = `SELECT * FROM chapters WHERE id=?`;
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
            var sql = `SELECT chapters.*,courses.course_name FROM chapters LEFT JOIN courses ON courses.id=chapters.course_id ORDER BY ID DESC`;
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

    static chapterShowByCreatorId(id, callback) {
        var sql = `SELECt p.* FROM (SELECT chapters.*,courses.course_name,courses.user_id FROM chapters LEFT JOIN courses ON courses.id=chapters.course_id)p LEFT JOIN users ON p.user_id=users.id WHERE p.user_id=${mysql.escape(id)} ORDER BY p.id DESC`;
        conn.query(sql, (err, result) => {
            if (err) {
                callback(true, err)
            }
            else {
                callback(false, result);
            }
        })
    }

    static showWithCourse(id, callback) {
        var sql = `SELECT * from chapters where course_id=${mysql.escape(id)}`;
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

    static async update(Udata, id, callback) {

        var chkSql = `SELECT * FROM chapters WHERE chapter_no=${mysql.escape(Udata.chapter_no)} AND course_id=${mysql.escape(Udata.course_id)} `;

        var chk = await new Promise((resolve, reject) => {
            conn.query(chkSql, (err, result) => {
                if (err) throw err;
                if (result.length > 0) {
                    resolve(false)
                } else {
                    resolve(true)
                }
            })
        })

        var data = {}
        if (chk) {
            data = {
                chapter_name: Udata.chapter_name,
                course_id: Udata.course_id,
                chapter_no: Udata.chapter_no
            }
        } else {
            data = {
                chapter_name: Udata.chapter_name,
                course_id: Udata.course_id,
            }
        }


       // console.log(data);


        var sql = `UPDATE chapters SET updated_at=NOW(), ? WHERE id=?`;

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
        // var sql = `DELETE FROM chapters WHERE id=?`;
        // conn.query(sql, id, (err, result) => {
        //     if (err) {
        //         callback(true, err)
        //     }
        //     else {
        //         callback(false, result);
        //     }
        // })


        var sql = `SELECT * FROM chapters WHERE id=${mysql.escape(id)}`;

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

        var sql2 = `SELECT * FROM enrollments WHERE course_id=${course_id}`;

        var enroll = await new Promise((resolve, reject) => {
            conn.query(sql2, (err, result) => {
                if (err) throw err; err

                if (result.length > 0) {
                    resolve(true)
                } else {
                    resolve(false)
                }
            })
        })

        if (!enroll) {



            var sql4 = `SELECT * FROM lessons WHERE chapter_id=${id}`;

            var numLesson = await new Promise((resolve, reject) => {
                conn.query(sql4, (err, result) => {
                    if (err) throw err;

                    if (result.length > 0) {
                        resolve(true)
                    } else {
                        resolve(false)
                    }
                })
            })


            if (!numLesson) {
                var sql3 = `DELETE FROM chapters where id=${mysql.escape(id)}`;

                conn.query(sql3, (err, result) => {

                    if (err) {
                        callback(true, null)
                    }
                    else {
                        callback(false, "delete successfull")
                    }

                })
            } else {
                callback(true, "this chapter has lessons, so chapter can't delete")
            }


        }
        else {
            callback(true, "course allready enroll, so chapter can't delete")
        }



    }

    static search(data, callback) {
        var sql = `SELECT * FROM(SELECT chapters.*,courses.course_name FROM chapters LEFT JOIN courses ON courses.id=chapters.course_id ORDER BY ID DESC)p WHERE course_name LIKE "%${data.course_name}%"`;

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

module.exports = Language;