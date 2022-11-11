const conn = require('../config/dbconfig');
var CourseTrackModel = require('../models/courseTrackModel');

exports.regularCourseTrack = (req, res) => {

    const { user_id, course_id, chapter_id, lesson_id, lesson_percentage, current_play_sec } = req.body;

    if (user_id && course_id && chapter_id && lesson_id ) {

        CourseTrackModel.trackInserUpdate(req.body, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: " track not done",
                    data: []
                })
            } else {
                res.status(200).json({
                    status: true,
                    msg: " track done ",
                    data: []
                })
            }
        })

    } else {
        res.status(200).json({
            status: false,
            msg: " all fields required ",
            data: []
        })
    }


}



exports.getTrackingDetails = (req, res) => {
    const { course_id, user_id } = req.body;

    if (course_id && user_id) {
        CourseTrackModel.getTrackingLessons(req.body, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: " data not found",
                    data: []
                })
            } else {
                res.status(200).json({
                    status: true,
                    msg: " data found ",
                    data: result
                })
            }
        })
    } else {
        res.status(200).json({
            status: false,
            msg: " all fields required ",
            data: []
        })
    }
}


exports.getCurrentLession = (req, res) => {
    const { course_id, user_id } = req.body;

    if (course_id && user_id) {
        CourseTrackModel.getCurrentLession(req.body, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: " data not found",
                    data: []
                })
            } else {
                res.status(200).json({
                    status: true,
                    msg: " data found ",
                    data: result
                })
            }
        })
    } else {
        res.status(200).json({
            status: false,
            msg: " all fields required ",
            data: []
        })
    }
}

exports.updateCurrentLesson=(req,res)=>{

    const {enroll_id,chapter_id,less_id}=req.body;

    if(enroll_id && chapter_id && less_id)
    {
        var sql=`UPDATE  enrollments SET updated_at=NOW(),current_chapter='${chapter_id}',current_lession='${less_id}' WHERE id='${enroll_id}'`;

        conn.query(sql,(err,result)=>{
            if(err) throw err;

            res.status(200).json({
                status: true,
                msg: " last lesson update success full ",
                data: []
            })

        })
    }else{
        res.status(200).json({
            status: false,
            msg: " all fields required ",
            data: []
        })
    }

}