const conn = require('../config/dbconfig');
const mysql = require('mysql');
require("dotenv").config();
const { getVideoDurationInSeconds } = require('get-video-duration')
const axios = require("axios")

function fancyTimeFormat(duration) {
    // Hours, minutes and seconds
    var hrs = ~~(duration / 3600);
    var mins = ~~((duration % 3600) / 60);
    var secs = ~~duration % 60;

    // Output like "1:01" or "4:03:59" or "123:03:59"
    var ret = "";

    if (hrs > 0) {
        ret += "" + hrs + "." + (mins < 10 ? "0" : "");
    }

    ret += "" + mins + "." + (secs < 10 ? "0" : "");
    ret += "" + secs;
    return ret;
}

function secondsToTime(e){
    const h = Math.floor(e / 3600).toString().padStart(2,'0'),
          m = Math.floor(e % 3600 / 60).toString().padStart(2,'0'),
          s = Math.floor(e % 60).toString().padStart(2,'0');
    
    return h + ':' + m + ':' + s;
    //return `${h}:${m}:${s}`;
}

class Language {



    static async create(data, callback) {

        var chkSql = `SELECT * FROM lessons WHERE lesson_no=${mysql.escape(data.lesson_no)} AND course_id=${mysql.escape(data.course_id)} AND chapter_id=${mysql.escape(data.chapter_id)}`;

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

            var duration = '';
            // From a URL...
            if (data.lesson_vedio_type == "link") {


                var url = `http://vimeo.com/api/oembed'json?url=${data.lesson_vedio_link}&width=640'`;
                var option = {
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }

                var vres = await axios.get(url, option);
                console.log("vedio ", vres.data)
                duration = fancyTimeFormat(vres.data.duration)

            } else if (data.lesson_vedio_type == "video") {


                duration = await getVideoDurationInSeconds(
                    process.env.vedios_path + data.lesson_vedio
                ).then((result) => result)
                    .catch((e) => console.log(e))

            }

            console.log("vedio length", duration);

            var sql = `INSERT INTO lessons(course_id,chapter_id,lesson_name,lesson_vedio,lesson_file,lesson_details,created_at,lesson_vedio_link,lesson_vedio_type,lesson_no,duration) 
            VALUES (${mysql.escape(data.course_id)},${mysql.escape(data.chapter_id)},${mysql.escape(data.lesson_name)}
            ,${mysql.escape(data.lesson_vedio ? data.lesson_vedio : null)},${mysql.escape(data.lesson_file ? data.lesson_file : null)},${mysql.escape(data.lesson_details)},NOW(),
            ${mysql.escape(data.lesson_vedio_link)},${mysql.escape(data.lesson_vedio_type)},
            ${mysql.escape(data.lesson_no)},
            ${mysql.escape(duration)}
            )`;
            // console.log(sql)
            conn.query(sql, (err, result) => {
                console.log(err)
                if (err) {
                    callback(true, null)
                }
                else {
                    callback(false, result);
                }
            })
        } else {
            callback(true, "lesson number allready exits!");
        }

    }

    static show(id, callback) {
        if (id) {
            var sql = `SELECT * FROM lessons WHERE id=?`;
            conn.query(sql, id, (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {

                    var data = [];

                    for (let item of result) {
                        let temp = {
                            id: item.id,
                            course_id: item.course_id,
                            chapter_id: item.chapter_id,
                            lesson_name: item.lesson_name,
                            lesson_vedio: item.lesson_vedio ? process.env.vedios_path + `${item.lesson_vedio}` : "",
                            lesson_file: item.lesson_file ? process.env.files_path + `${item.lesson_file}` : "",
                            lesson_details: item.lesson_details,
                            lesson_vedio_type: item.lesson_vedio_type,
                            lesson_vedio_link: item.lesson_vedio_link,
                            lesson_no: item.lesson_no
                        }
                        data.push(temp)
                    }

                    callback(false, data);
                }
            })
        }
        else {
            var sql = `SELECT l.*,c.course_name,cp.chapter_name FROM lessons l LEFT JOIN courses c on c.id=l.course_id LEFT JOIN chapters cp ON cp.id=l.chapter_id ORDER BY ID DESC`;
            conn.query(sql, (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {
                    var data = [];

                    for (let item of result) {
                        let temp = {
                            id: item.id,
                            course_id: item.course_id,
                            chapter_id: item.chapter_id,
                            lesson_name: item.lesson_name,
                            course_name: item.course_name,
                            chapter_name: item.chapter_name,
                            lesson_vedio: item.lesson_vedio ? process.env.vedios_path + `${item.lesson_vedio}` : "",
                            lesson_file: item.lesson_file ? process.env.files_path + `${item.lesson_file}` : "",
                            lesson_vedio_type: item.lesson_vedio_type,
                            lesson_vedio_link: item.lesson_vedio_link,
                            lesson_no: item.lesson_no
                        }
                        data.push(temp)
                    }

                    callback(false, data);
                }
            })
        }
    }

    static getLessonByCreatorId(id, callback) {
        var sql = `SELECT p.* FROM (SELECT l.*,c.course_name,c.user_id,cp.chapter_name FROM lessons l LEFT JOIN courses c on c.id=l.course_id LEFT JOIN chapters cp ON cp.id=l.chapter_id )p LEFT JOIN users ON users.id=p.user_id WHERE p.user_id=${mysql.escape(id)} ORDER BY p.id DESC`;
        //console.log(sql);
        conn.query(sql, (err, result) => {
            if (err) {
                callback(true, err)
            }
            else {

                var data = [];

                for (let item of result) {
                    let temp = {
                        id: item.id,
                        course_id: item.course_id,
                        chapter_id: item.chapter_id,
                        lesson_name: item.lesson_name,
                        course_name: item.course_name,
                        chapter_name: item.chapter_name,
                        lesson_vedio: item.lesson_vedio ? process.env.vedios_path + `${item.lesson_vedio}` : "",
                        lesson_file: item.lesson_file ? process.env.files_path + `${item.lesson_file}` : ""
                    }
                    data.push(temp)
                }

                callback(false, data);
            }
        })
    }

    static async update(data, id, lesson_no, callback) {

        var chkSql = `SELECT * FROM lessons WHERE lesson_no=${mysql.escape(lesson_no)} AND course_id=${mysql.escape(data.course_id)} AND chapter_id=${mysql.escape(data.chapter_id)}`;

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
            data.lesson_no = lesson_no;
        }


        var sql = `UPDATE lessons SET updated_at=NOW(), ? WHERE id=?`;

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
        // var sql = `DELETE FROM lessons WHERE id=?`;
        // conn.query(sql, id, (err, result) => {
        //     if (err) {
        //         callback(true, err)
        //     }
        //     else {
        //         callback(false, result);
        //     }
        // })


        var sql = `SELECT * FROM lessons WHERE id=${mysql.escape(id)}`;

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
                if (err) throw err;

                if (result.length > 0) {
                    resolve(true)
                } else {
                    resolve(false)
                }
            })
        })

        if (!enroll) {
            var sql3 = `DELETE FROM lessons where id=${mysql.escape(id)}`;

            conn.query(sql3, (err, result) => {

                if (err) {
                    callback(true, null)
                }
                else {
                    callback(false, "delete successfull")
                }

            })
        }
        else {
            callback(true, "course allready enroll, so lesson can't delete")
        }





    }

    static search(data, callback) {
        var sql = `SELECT * FROM(SELECT l.*,c.course_name,cp.chapter_name FROM lessons l LEFT JOIN courses c on c.id=l.course_id LEFT JOIN chapters cp ON cp.id=l.chapter_id ORDER BY ID DESC)p WHERE course_name LIKE "%${data.course_name}%"`;

        conn.query(sql, (err, result) => {
            if (err) throw err;

            if (result.length > 0) {

                var data = [];

                for (let item of result) {
                    let temp = {
                        id: item.id,
                        course_id: item.course_id,
                        chapter_id: item.chapter_id,
                        lesson_name: item.lesson_name,
                        course_name: item.course_name,
                        chapter_name: item.chapter_name,
                        lesson_vedio: item.lesson_vedio ? process.env.vedios_path + `${item.lesson_vedio}` : "",
                        lesson_file: item.lesson_file ? process.env.files_path + `${item.lesson_file}` : "",
                        lesson_vedio_type: item.lesson_vedio_type,
                        lesson_vedio_link: item.lesson_vedio_link
                    }
                    data.push(temp)
                }

                callback(false, data);
            }
            else {
                callback(true, null)
            }
        })
    }
}

module.exports = Language;