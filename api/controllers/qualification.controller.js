const qualification = require('../models/qualification.model');
const { statusMessages } = require('../helper/constant');
const e = require('connect-flash');


exports.create = (req, res) => {
    const { name } = req.body;
    if (name) {
        qualification.create(req.body, (err, result) => {
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
    } else {
        res.status(200).json({
            status: false,
            msg: statusMessages.allFieldRequired,
            data: []
        })
    }
}


exports.getAllUser = (req, res) => {
    qualification.show(null, (err, result) => {
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
        qualification.show(id, (err, result) => {
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
    const { id, name } = req.body;

    const data = {
        name: name
    }

    if (id) {
        qualification.update(data, id, (err, result) => {
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
        qualification.delete(id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: "not delete",
                    data: []
                })
            }
            else {
                res.status(200).json({
                    status: true,
                    msg: "delete successfull",
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
