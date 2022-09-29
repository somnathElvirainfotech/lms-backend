const certificateModel = require('../models/certificateModel');
const { statusMessages } = require('../helper/constant');
const e = require('connect-flash');
const fs = require('fs');
const path = require('path')
require('dotenv').config();



exports.create = (req, res) => {
    // const { name } = req.body;
    // if (name) {

    var certificate_file = '';

    console.log(req.files);

    if (req.files) {
        if (req.files.certificate_file) {
            var fileName = Date.now() + '_' + req.files.certificate_file.name;
            var newPath = path.join(process.cwd(), 'uploads/certificate', fileName)
            req.files.certificate_file.mv(newPath);
            certificate_file = fileName;
        }
    }
    else if (req.body.certificate_file) {
        certificate_file = req.body.certificate_file;
    }

    var data = {
        certificate_name: certificate_file
    }

    console.log(data);

    certificateModel.create(data, (err, result) => {
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

    // }
    // else {
    //     res.status(200).json({
    //         status: false,
    //         msg: statusMessages.allFieldRequired,
    //         data: []
    //     })
    // }
}


exports.getAllUser = (req, res) => {
    certificateModel.show(null, (err, result) => {
        if (err) {
            res.status(200).json({
                status: false,
                msg: statusMessages.dataNotFound,
                data: []
            })
        }
        else {


            if (result.length > 0) {
                var tempData = [];

                for (var i of result) {
                    var temp = {
                        id: i.id,
                        certificate_name: i.certificate_name ? process.env.certificate_file_path + i.certificate_name : '',
                        created_at: i.created_at,
                        updated_at: i.updated_at,
                    };

                    tempData.push(temp)
                }

                res.status(200).json({
                    status: true,
                    msg: statusMessages.dataFound,
                    data: tempData
                })
            }
            else {
                res.status(200).json({
                    status: false,
                    msg: statusMessages.dataNotFound,
                    data: result
                })
            }



        }
    })
}

exports.getUser = (req, res) => {
    const { id } = req.params;
    if (id) {
        certificateModel.show(id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: statusMessages.dataNotFound,
                    data: []
                })
            }
            else {

                if (result.length > 0) {
                    var tempData = [];

                    for (var i of result) {
                        var temp = {
                            id: i.id,
                            certificate_name: i.certificate_name ? process.env.certificate_file_path + i.certificate_name : '',
                            created_at: i.created_at,
                            updated_at: i.updated_at,
                        };

                        tempData.push(temp)
                    }

                    res.status(200).json({
                        status: true,
                        msg: statusMessages.dataFound,
                        data: tempData
                    })
                }
                else {
                    res.status(200).json({
                        status: false,
                        msg: statusMessages.dataNotFound,
                        data: result
                    })
                }
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

exports.update = async (req, res) => {
    const { id } = req.body;


    if (id) {

        var certificate_file = '';
        var data = {};
        var preFile = '';

        if (req.files) {
            if (req.files.certificate_file) {
                var fileName = Date.now() + '_' + req.files.certificate_file.name;
                var newPath = path.join(process.cwd(), 'uploads/certificate', fileName)
                req.files.certificate_file.mv(newPath);
                certificate_file = fileName;
            }
        }
        else if (req.body.certificate_file) {
            certificate_file = req.body.certificate_file;

            var tempData = await new Promise(function (resolve, reject) {
                certificateModel.show(id, (err, result) => {
                    if (err) throw err;

                    if (result.length > 0) {
                        resolve(result)
                    } else {
                        resolve(null)
                    }
                })
            })

            //console.log("hhhhhh")
            preFile = tempData[0].certificate_name;
        }


        if (certificate_file) {
            data.certificate_name = certificate_file
        }



        certificateModel.update(data, id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: statusMessages.notUpdate,
                    data: []
                })
            }
            else {

                console.log("certificatep  ", preFile);
                if (preFile) {

                    fs.unlink('uploads/certificate/' + preFile, (err) => {
                        if (err) throw err;

                        console.log("file delete");
                    })
                }

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


exports.delete = async (req, res) => {
    const { id } = req.params;
    var preFile = '';

    if (id) {

        var tempData = await new Promise(function (resolve, reject) {
            certificateModel.show(id, (err, result) => {
                if (err) throw err;

                if (result.length > 0) {
                    resolve(result)
                } else {
                    resolve(null)
                }
            })
        })

        //console.log("hhhhhh")
        if (tempData != null)
            preFile = tempData[0].certificate_name;

        certificateModel.delete(id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: "not delete",
                    data: []
                })
            }
            else {

                console.log("certificatep  ", preFile);
                if (preFile) {

                    fs.unlink('uploads/certificate/' + preFile, (err) => {
                        if (err) throw err;

                        console.log("file delete");
                    })
                }

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
