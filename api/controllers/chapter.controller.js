const chapterController = require('../models/chapter.model');
const { statusMessages } = require('../helper/constant');
const e = require('connect-flash');


exports.create = (req, res) => {
    // console.log("chapterrrrr ",req.body);
    const { chapter_name, course_id, chapter_no } = req.body;
    if (chapter_name && course_id && chapter_no) {
        chapterController.create(req.body, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: result ? result : "create not successfull",
                    data: []
                })
            }
            else {
                res.status(200).json({
                    status: true,
                    msg: "create successfull",
                    data: []
                })
            }
        })
    }
    else {
        res.status(200).json({
            status: false,
            msg: statusMessages.allFieldRequired,
            data: []
        })
    }
}


exports.getAllUser = (req, res) => {
    chapterController.show(null, (err, result) => {
        if (err) {
            res.status(200).json({
                status: false,
                msg: statusMessages.dataNotFound,
                data: []
            })
        }
        else {
            res.status(200).json({
                status: true,
                msg: statusMessages.dataFound,
                data: result
            })
        }
    })
}

exports.getUser = (req, res) => {
    const { id } = req.params;
    if (id) {
        chapterController.show(id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: statusMessages.dataNotFound,
                    data: []
                })
            }
            else {
                res.status(200).json({
                    status: true,
                    msg: statusMessages.dataFound,
                    data: result
                })
            }
        })
    }
    else {
        res.status(200).json({
            status: true,
            msg: "id is required",
            data: []
        })
    }
}

exports.update = (req, res) => {
    const { chapter_name, course_id, chapter_no, id } = req.body;

    const data = {
        chapter_name: chapter_name,
        course_id: course_id,
        chapter_no: chapter_no
    }

    if (id && chapter_name) {
        chapterController.update(data, id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: statusMessages.notUpdate,
                    data: []
                })
            }
            else {
                res.status(200).json({
                    status: true,
                    msg: statusMessages.update,
                    data: []
                })
            }
        })
    }
    else {
        res.status(200).json({
            status: false,
            msg: "id is required",
            data: []
        })
    }
}


exports.delete = (req, res) => {
    const { id } = req.params;

    if (id) {
        chapterController.delete(id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: result != null ? result : "not delete",
                    data: []
                })
            }
            else {
                res.status(200).json({
                    status: true,
                    msg: result != null ? result : "delete successfull",
                    data: []
                })
            }
        })
    }
    else {
        res.status(200).json({
            status: false,
            msg: statusMessages.requiredId,
            data: []
        })
    }
}


exports.showWithCourse = (req, res) => {
    //console.log(11)
    const { id } = req.params;

    if (id) {
        chapterController.showWithCourse(id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: statusMessages.dataNotFound,
                    data: []
                })
            }
            else {
                res.status(200).json({
                    status: true,
                    msg: statusMessages.dataFound,
                    data: result
                })
            }
        })
    }
    else {
        res.status(200).json({
            status: false,
            msg: statusMessages.requiredId,
            data: []
        })
    }
}

exports.chapterShowByCreatorId = (req, res) => {
    const { id } = req.params;

    if (id) {
        chapterController.chapterShowByCreatorId(id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: statusMessages.dataNotFound,
                    data: []
                })
            }
            else {
                res.status(200).json({
                    status: true,
                    msg: statusMessages.dataFound,
                    data: result
                })
            }
        })
    }
    else {
        res.status(200).json({
            status: false,
            msg: statusMessages.requiredId,
            data: []
        })
    }
}

exports.chapterSearch = (req, res) => {
    chapterController.search(req.body, (err, result) => {
        if (err) {
            res.status(200).json({
                status: false,
                msg: statusMessages.dataNotFound,
                data: []
            })
        } else {
            res.status(200).json({
                status: true,
                msg: statusMessages.dataFound,
                data: result
            })
        }
    })
}