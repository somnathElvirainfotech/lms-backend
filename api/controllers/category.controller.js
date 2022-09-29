const categoryModel = require('../models/category.model');
const { statusMessages } = require('../helper/constant');
const path = require('path');


exports.create = (req, res) => {
    const { c_name, c_status, c_description } = req.body;
    console.log("sss  ", req.body.c_parent_id)
    if (c_name) {

        // console.log("sss  "+req.files)


        if (req.files) {
            var fileName = Date.now() + '_' + req.files.c_image.name;
            var newPath = path.join(process.cwd(), 'uploads/images', fileName)
            req.files.c_image.mv(newPath);
        }

        const data = {
            c_name: req.body.c_name,
            c_description: req.body.c_description,
            c_image: req.files ? fileName : req.body.fileName,
            c_parent_id: req.body.c_parent_id,
            c_status: req.body.c_status
        }

        // console.log(data)

        categoryModel.create(data, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: "category not create",
                    data: []
                })
            } else {
                res.status(200).json({
                    status: true,
                    msg: "category create successfully",
                    data: []
                })
            }
        })
    }
}


exports.findAll = (req, res) => {

    categoryModel.show(null, (err, result) => {
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


exports.findByID = (req, res) => {
    const { id } = req.params;

    if (id) {
        categoryModel.show(id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: statusMessages.dataNotFound,
                    data: []
                })
            }
            else {
                if (result.length) {
                    res.status(200).json({
                        status: true,
                        msg: statusMessages.dataFound,
                        data: result
                    })
                }
                else {
                    res.status(200).json({
                        status: false,
                        msg: statusMessages.dataNotFound,
                        data: []
                    })
                }
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

exports.update = (req, res) => {
    const { id } = req.body;

    if (id) {

        if (req.files) {
            var fileName = Date.now() + '_' + req.files.c_image.name;
            var newPath = path.join(process.cwd(), 'uploads/images', fileName)
            req.files.c_image.mv(newPath);
        }

        const data = {
            c_name: req.body.c_name,
            c_description: req.body.c_description,
            c_image: req.files ? fileName : req.body.fileName,
            c_parent_id: req.body.c_parent_id ? req.body.c_parent_id : 0,
            c_status: req.body.c_status
        }

        categoryModel.update(data, id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: "update not successfull",
                    data: []
                })
            }
            else {
                res.status(200).json({
                    status: true,
                    msg: "update successfull",
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

exports.delete = (req, res) => {
    const { id } = req.params;

    if (id) {
        categoryModel.delete(id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: "delete not successfull",
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
}

exports.get_parent_catagory = (req, res) => {
    //console.log(12)
    categoryModel.get_parentCatagory((err, result) => {
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

exports.get_sub_category = (req, res) => {
    const { pid } = req.params;

    if (pid) {
        categoryModel.get_subCategory(pid, (err, result) => {
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

    } else {
        categoryModel.get_subCategory(null, (err, result) => {
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
}

exports.get_parent_sub_category = (req, res) => {
    categoryModel.get_parent_sub_category((err, result) => {
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



