const commentModel = require('../models/ratingCommnet.model');
const { statusMessages } = require('../helper/constant');
const e = require('connect-flash');


exports.create = (req, res) => {
    const { user_id, course_id, rating_number, comment } = req.body;



    if (user_id && course_id && rating_number && comment) {
        commentModel.create(req.body, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: "create not successfull",
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


exports.getByCourseId = (req, res) => {

    // course id
    const { course_id, limit, user_id } = req.body;

    if (course_id || user_id) {
        commentModel.show(req.body, (err, result) => {
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

    } else {
        res.status(200).json({
            status: false,
            msg: statusMessages.requiredId,
            data: []
        })
    }

}

exports.getAll = (req, res) => {
    commentModel.show(null, (err, result) => {
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

exports.chkComment = (req, res) => {
    const { user_id, course_id } = req.body;

    if (user_id && course_id) {
        commentModel.chkComment(req.body, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: "comment present",
                    data: []
                })
            } else {
                res.status(200).json({
                    status: true,
                    msg: "no comment present",
                    data: []
                })
            }
        })

    } else {
        res.status(200).json({
            status: false,
            msg: statusMessages.allFieldRequired,
            data: []
        })
    }
}



// task

exports.createTask = (req, res) => {
    const { user_id, task_id, rating_number, comment } = req.body;



    if (user_id && task_id && rating_number && comment) {
        commentModel.taskCreate(req.body, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: "create not successfull",
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


exports.getByTaskId = (req, res) => {

    // course id
    const { task_id, limit } = req.body;

    if (task_id) {
        commentModel.showTask(req.body, (err, result) => {
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

    } else {
        res.status(200).json({
            status: false,
            msg: statusMessages.requiredId,
            data: []
        })
    }

}

exports.getAllTask = (req, res) => {
    commentModel.showTask(null, (err, result) => {
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

exports.chkCommentTask = (req, res) => {
    const { task_id, user_id } = req.body;

    if (task_id && user_id) {
        commentModel.chkCommentTask(req.body, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: "comment present",
                    data: []
                })
            } else {
                res.status(200).json({
                    status: true,
                    msg: "no comment present",
                    data: []
                })
            }
        })

    } else {
        res.status(200).json({
            status: false,
            msg: statusMessages.allFieldRequired,
            data: []
        })
    }
}

exports.delete = (req, res) => {
    const { id } = req.params;

    if (id) {
        commentModel.delete(id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: "not delete",
                    data: []
                })
            } else {
                res.status(200).json({
                    status: true,
                    msg: "delete successfull",
                    data: []
                })
            }
        })
    } else {
        res.status(200).json({
            status: false,
            msg: statusMessages.allFieldRequired,
            data: []
        })
    }
}

exports.update = (req, res) => {
    const { id, comment,rating_number } = req.body;

    const data = {
        comment: comment,
        rating_number:rating_number
    }

    console.log(req.body);

    if (id) {
        commentModel.update(data, id, (err, result) => {
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
