var mysql = require('mysql');
var conn = require('../config/dbconfig');

class Activity {

    Search(data, callback) {
        var fromDate = data.fromDate;
        var toDate = data.toDate;
        var courseId = data.courseId;

        var searchType = data.searchType;
        var course_detail_Type = data.course_detail_Type ? data.course_detail_Type : '';
        var enroll_users_list = data.enroll_users_list ? data.enroll_users_list : "deactive";
        var total_comment = data.total_comment ? data.total_comment : "deactive";

        var today = toDate ? this.formatDate(toDate) : this.formatDate(new Date());
        var previousday = fromDate ? this.formatDate(fromDate) : this.previousDays(new Date(), 60);

        console.log("today=", today, "  previous=", previousday, "   ", searchType);

        var sql = ``;



        if (searchType == "course") {
            sql = `SELECT *,(SELECT COUNT(id) FROM enrollments WHERE enrollments.user_enroll_status='active' AND enrollments.course_id=courses.id) AS total_enroll,(SELECT COUNT(id) FROM course_comments WHERE course_comments.course_id=courses.id) AS total_comment,(SELECT CONCAT_WS(" ",users.firstname,users.lastname) AS creator_name FROM users WHERE users.id=courses.user_id) AS creator_name,(SELECT email FROM users WHERE users.id=courses.user_id) AS creator_email,(SELECT COUNT(id) FROM chapters WHERE chapters.course_id=courses.id) AS total_chapter,(SELECT COUNT(id) FROM lessons WHERE lessons.course_id=courses.id) AS total_lesson,(SELECT c_name FROM category WHERE category.id=courses.category_id ) AS category_name FROM  courses WHERE DATE(created_at) BETWEEN ${mysql.escape(previousday)} AND ${mysql.escape(today)}`;


            // if (searchType == "course" && courseId && course_detail_Type == "lesson") {
            //     sql = `SELECT * FROM lessons WHERE lessons.course_id=${mysql.escape(courseId)}`;
            // }
            if (searchType == "course" && courseId && (course_detail_Type == "chapter" || course_detail_Type == "lesson")) {
                sql = `SELECT * FROM chapters WHERE chapters.course_id=${mysql.escape(courseId)}`;
            }
            else if (searchType == "course" && courseId && enroll_users_list == "active") {
                sql = `SELECT *,(SELECT course_name FROM courses WHERE courses.id=enrollments.course_id) course_name,(SELECT CONCAT_WS(" ",users.firstname,users.lastname) AS creator_name FROM users WHERE users.id=enrollments.user_id) AS fullname,(SELECT email FROM users WHERE users.id=enrollments.user_id) AS user_email FROM enrollments WHERE course_id=${mysql.escape(courseId)}`;
            }
            else if (searchType == "course" && courseId && total_comment == "active") {
                sql = `SELECT *,(SELECT course_name FROM courses WHERE courses.id=course_comments.course_id) AS course_name,(SELECT CONCAT_WS(" ",users.firstname,users.lastname) AS creator_name FROM users WHERE users.id=course_comments.user_id) AS fullname,(SELECT email FROM users WHERE users.id=course_comments.user_id) AS user_email FROM course_comments WHERE course_id=${mysql.escape(courseId)}`;

            }
            else if (searchType == "course" && courseId) {
                sql = `SELECT *,(SELECT COUNT(id) FROM enrollments WHERE enrollments.user_enroll_status='active' AND enrollments.course_id=courses.id) AS total_enroll,(SELECT COUNT(id) FROM course_comments WHERE course_comments.course_id=courses.id) AS total_comment,(SELECT CONCAT_WS(" ",users.firstname,users.lastname) AS creator_name FROM users WHERE users.id=courses.user_id) AS creator_name,(SELECT email FROM users WHERE users.id=courses.user_id) AS creator_email,(SELECT COUNT(id) FROM chapters WHERE chapters.course_id=courses.id) AS total_chapter,(SELECT COUNT(id) FROM lessons WHERE lessons.course_id=courses.id) AS total_lesson,(SELECT c_name FROM category WHERE category.id=courses.category_id ) AS category_name FROM  courses WHERE id=${mysql.escape(courseId)}`;
            }

        } else if (searchType == "enrollment") {
            sql = `SELECT enrollments.*,CONCAT_WS(" ",users.firstname,users.lastname) AS user_name,users.email,users.user_hr_no,courses.course_name,(SELECT lesson_name FROM lessons WHERE lessons.id=enrollments.current_lession) AS lesson_name,(SELECT chapter_name FROM chapters WHERE chapters.id=enrollments.current_chapter) AS chapter_name FROM enrollments LEFT JOIN users ON users.id=enrollments.user_id LEFT JOIN courses ON courses.id=enrollments.course_id WHERE DATE(enrollments.created_at) BETWEEN ${mysql.escape(previousday)} AND ${mysql.escape(today)}`;
        }


        console.log("sql", sql);

        conn.query(sql, async (err, result) => {
            if (err) throw err;

            if (result.length > 0) {
                if (searchType == "course" && courseId) {

                    if (course_detail_Type == '') {
                        var tempArr = [];

                        for (var item of result) {

                            var sql1 = `SELECT course_group.*,groups.g_name FROM course_group LEFT JOIN groups on groups.id=course_group.group_id WHERE course_group.course_id=${item.id}`;


                            var groups = await new Promise((resolve, reject) => {
                                conn.query(sql1, (err, result) => {
                                    if (err) throw err
                                    resolve(result);
                                    console.log(sql1);
                                })
                            })
                            var temp = '';

                            for (var cate of groups) {
                                temp += cate.g_name + ',';
                            }

                            var tt = item;
                            temp = temp.slice(0, -1);
                            tt.group_name = '(' + temp + ')';

                            tempArr.push(tt)
                        }

                        callback(false, tempArr)
                    }
                    else if (course_detail_Type == 'lesson') {

                        var tempArr = [];
                        for (var item of result) {
                            var temp = item;
                            temp.lesson_details = [];

                            sql = `SELECT * FROM lessons WHERE lessons.course_id=${mysql.escape(courseId)} AND chapter_id=${mysql.escape(item.id)}`;

                            console.log(sql);

                            var lessons = await new Promise((resolve, reject) => {
                                conn.query(sql, (err, result) => {
                                    if (err) throw err
                                    resolve(result);
                                    //console.log(sqll);
                                })
                            })

                            temp.lesson_details = lessons;

                            tempArr.push(temp);
                        }

                        callback(false, tempArr)
                    } else if (course_detail_Type == "chapter") {
                        callback(false, result)
                    }

                } else {
                    callback(false, result)
                }

            } else {
                callback(true, null)
            }
        })







    }




    formatDate(date) {
        var d = new Date(date);
        var month = '' + (d.getMonth() + 1);
        var day = '' + d.getDate();
        var year = d.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        return [year, month, day].join('-');
    }

    previousDays(date, days) {
        var result = new Date(date);
        result.setDate(result.getDate() - (days));
        //return result;

        var d = result
        var month = '' + (d.getMonth() + 1);
        var day = '' + d.getDate();
        var year = d.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        return [year, month, day].join('-');
    }
}

module.exports = new Activity();