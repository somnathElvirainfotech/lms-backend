var CourseTrackModel = require('../models/courseTrackModel');

exports.regularCourseTrack = (req, res) => {

    const { user_id, course_id, chapter_id, lesson_id, lesson_percentage, current_play_sec } = req.body;

    if (user_id && course_id && chapter_id && lesson_id && lesson_percentage && current_play_sec) {

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