var mysql = require('mysql');
var conn = require('../config/dbconfig.js');

class CourseTrackModel {

    async trackInserUpdate(data, callback) {

        // track status
        var track_status = '';

        if (data.lesson_percentage >= 90)
            track_status = 'completed';
        else if (data.lesson_percentage == 0)
            track_status = 'pending';
        else
            track_status = 'onprogress';




        // course Track check 
        var courseTrackId = await new Promise((resolve, reject) => {
            var payload = {
                user_id: data.user_id,
                course_id: data.course_id
            }

            this.checkCourseTrack(payload, (result, value) => {
                resolve(value)
            })
        })


        // course Track insert and update
        if (courseTrackId != null) {

            // course track update
            var sql = `UPDATE course_track SET updated_at=NOW() WHERE id=${mysql.escape(courseTrackId)}`;

            conn.query(sql, (err, result) => {
                if (err) throw err;
            })


            // course Track Details check
            var courseTrackDetailsData = await new Promise((resolve, reject) => {

                var payload = {
                    course_track_id: courseTrackId,
                    lesson_id: data.lesson_id,
                    chapter_id: data.chapter_id
                }

                this.checkCourseTrackDetails(payload, (result, value) => {

                    if (result)
                        resolve(value);
                    else
                        resolve({ id: null })
                })
            })

            var courseTrackDetailsId = courseTrackDetailsData.id;


            // course Track Details insert and update
            if (courseTrackDetailsId != null) {



                var courseTrackDetailsStatus = courseTrackDetailsData.status;
                var courseTrackDetailsPercentage = courseTrackDetailsData.lesson_percentage;

                console.log(courseTrackDetailsStatus);

                var payload = {
                    lesson_percentage: courseTrackDetailsPercentage >=90 ? 100 : data.lesson_percentage,
                    current_play_sec: data.current_play_sec,
                    status: courseTrackDetailsStatus == 'completed' ? 'completed' : track_status,
                    id: courseTrackDetailsId
                }

                // course track details update
                await new Promise((resolve, reject) => {
                    this.courseDetailsUpdate(payload, err => resolve(err))
                })


            } else {

                var payload = {
                    course_track_id: courseTrackId,
                    chapter_id: data.chapter_id,
                    lesson_id: data.lesson_id,
                    lesson_percentage: data.lesson_percentage,
                    current_play_sec: data.current_play_sec,
                    chapter_id: data.chapter_id,
                    status: track_status
                }


                // course track details insert
                await new Promise((resolve, reject) => {
                    this.courseDetailsInsert(payload, err => resolve(err))
                })

            }

        }
        else {


            // course track insert
            var sql = `INSERT INTO course_track(user_id,course_id,created_at) VALUES  (
                ${mysql.escape(data.user_id)},
                ${mysql.escape(data.course_id)},
                NOW()
            )`;

            var newCourseTrackId = await new Promise((resolve, reject) => {
                conn.query(sql, (err, result) => {
                    if (err) throw err;

                    resolve(result.insertId)
                })
            })

            // course Track Details insert and update
            if (newCourseTrackId) {

                var payload = {
                    course_track_id: newCourseTrackId,
                    chapter_id: data.chapter_id,
                    lesson_id: data.lesson_id,
                    lesson_percentage: data.lesson_percentage,
                    current_play_sec: data.current_play_sec,
                    status: track_status
                }


                // course track details insert
                await new Promise((resolve, reject) => {
                    this.courseDetailsInsert(payload, err => resolve(err))
                })




            }
        }



        // enrollment updated
        var payload = {
            current_chapter: data.chapter_id,
            current_lession: data.lesson_id,
            user_id: data.user_id,
            course_id: data.course_id
        }

        //console.log(payload);
        await new Promise((resolve, reject) => {
            this.enrollmentCurrentCourseTrackingUpdate(payload, (err) => {
                resolve(true)
            });
        })

        
        callback(false, null)


    }


    courseDetailsUpdate(data, callback) {

        var sql = `UPDATE course_track_details SET 
                updated_at=NOW(),
                lesson_percentage=${mysql.escape(data.lesson_percentage)},
                current_play_sec=${mysql.escape(data.current_play_sec)},
                status=${mysql.escape(data.status)}  
                WHERE id=${mysql.escape(data.id)}
                `;

        conn.query(sql, (err, result) => {
            if (err) throw err;
            callback(true)
        })

    }

    courseDetailsInsert(data, callback) {
        var sql = `INSERT INTO course_track_details (course_track_id,chapter_id, lesson_id, lesson_percentage, current_play_sec, status, created_at) VALUES (
            ${mysql.escape(data.course_track_id)},
            ${mysql.escape(data.chapter_id)},
            ${mysql.escape(data.lesson_id)},
            ${mysql.escape(data.lesson_percentage)},
            ${mysql.escape(data.current_play_sec)},
            ${mysql.escape(data.status)},
            NOW()                
        )`;

        conn.query(sql, (err, result) => {
            if (err) throw err;
            callback(true)
        })
    }

    async enrollmentCurrentCourseTrackingUpdate(data, callback) {


        var courseData = await new Promise((resolve, reject) => {
            this.totalCourseStatus(data, (err, result) => {
                resolve(result)
            })
        })

        console.log(courseData);

        var sql = `UPDATE enrollments SET 
        current_chapter=${mysql.escape(data.current_chapter)},
        current_lession=${mysql.escape(data.current_lession)},
        course_progress=${mysql.escape(courseData.completeLesson)},
        enrollment_status=${mysql.escape(courseData.courseStatus)},
        updated_at=NOW() 
        WHERE user_id=${mysql.escape(data.user_id)} AND course_id=${mysql.escape(data.course_id)}
        `;

        conn.query(sql, (err, result) => {
            if (err) throw err;
            callback(true)
        })
    }



    async totalCourseStatus(data, callback) {

        var sql = `SELECT *,(SELECT COUNT(id) FROM chapters WHERE chapters.course_id=courses.id) AS total_chapter,(SELECT COUNT(id) FROM lessons WHERE lessons.course_id=courses.id) AS total_lesson FROM courses WHERE id=${mysql.escape(data.course_id)}`;

        var singleCourseData = await new Promise((resolve, reject) => {
            conn.query(sql, (err, result) => {
                if (err) throw err;

                if (result.length > 0) {
                    resolve(result[0])
                } else {
                    resolve([])
                }

            })
        })




        var sql2 = `SELECT course_track_details.*,course_track.course_id,course_track.user_id FROM course_track_details LEFT JOIN course_track ON course_track.id=course_track_details.course_track_id WHERE course_track.course_id=${mysql.escape(data.course_id)} AND course_track.user_id=${mysql.escape(data.user_id)}`;


        var singleCourseLessonData = await new Promise((resolve, reject) => {
            conn.query(sql2, (err, result) => {
                if (err) throw err;

                if (result.length > 0) {
                    resolve(result)
                } else {
                    resolve([])
                }

            })
        })

        // console.log(singleCourseLessonData[0].status);

        var completeLesson = 0;
        var courseStatus = 'onprogress';

        for (var i = 0; i < Number(singleCourseData.total_lesson); i++) {
            if (i < singleCourseLessonData.length) {
                if (singleCourseLessonData[i].status == 'completed') {
                    completeLesson += 1;
                }
            }
        }

        var coursePercentage = (completeLesson / Number(singleCourseData.total_lesson)) * 100;


        if (coursePercentage >= 90) {
            courseStatus = 'completed';
        }

        callback(true, { completeLesson: coursePercentage, courseStatus: courseStatus });


    }



    checkCourseTrack(data, callback) {
        var sql = `SELECT * FROM course_track WHERE user_id=${mysql.escape(data.user_id)} AND course_id=${mysql.escape(data.course_id)} `;

        conn.query(sql, (err, result) => {
            if (err) throw err;

            if (result.length > 0) {
                callback(true, result[0].id);
            } else {
                callback(false, null)
            }
        })
    }

    checkCourseTrackDetails(data, callback) {
        var sql = `SELECT * FROM course_track_details WHERE course_track_id=${mysql.escape(data.course_track_id)} AND lesson_id=${mysql.escape(data.lesson_id)} AND chapter_id=${mysql.escape(data.chapter_id)}`;

        conn.query(sql, (err, result) => {
            if (err) throw err;

            if (result.length > 0) {
                callback(true, result[0])
            } else {
                callback(false, null)
            }
        })
    }


    getTrackingLessons(data, callback) {
        var sql2 = `SELECT course_track_details.*,course_track.course_id,course_track.user_id FROM course_track_details LEFT JOIN course_track ON course_track.id=course_track_details.course_track_id WHERE course_track.course_id=${mysql.escape(data.course_id)} AND course_track.user_id=${mysql.escape(data.user_id)}`;


        conn.query(sql2, (err, result) => {
            if (err) throw err;

            if (result.length > 0) {
                callback(false, result)
            } else {
                callback(true, [])
            }

        })
    }


    async getCurrentLession(data, callback) {
        var sql = `SELECT * FROM enrollments WHERE course_id=${mysql.escape(data.course_id)} AND user_id=${mysql.escape(data.user_id)} `;

        var enrollmentData = await new Promise((resolve, reject) => {
            conn.query(sql, (err, result) => {
                if (err) throw err;

                if (result.length > 0) {
                    resolve(result[0])
                } else {
                    resolve([])
                }
            })
        })


        var sql2 = `SELECT course_track_details.* FROM course_track LEFT JOIN course_track_details ON course_track_details.course_track_id=course_track.id WHERE course_track.user_id=${mysql.escape(data.user_id)} AND course_track.course_id=${mysql.escape(data.course_id)} AND course_track_details.chapter_id=${mysql.escape(enrollmentData.current_chapter)} AND course_track_details.lesson_id=${mysql.escape(enrollmentData.current_lession)}`;

        conn.query(sql2, (err, result) => {
            if (err) throw err;

            if (result.length > 0) {
                callback(false, result)
            } else {
                callback(true, null)
            }
        })



    }



}

module.exports = new CourseTrackModel();