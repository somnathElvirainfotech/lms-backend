const logoModel = require('../models/logo.model');
const { statusMessages } = require('../helper/constant');
const e = require('connect-flash');
const fs = require('fs');
const path = require('path')
require('dotenv').config();



exports.create = (req, res) => {
    // const { name } = req.body;
    // if (name) {

    var logo_name = '';

    console.log(req.files);

    if (req.files) {
        if (req.files.logo_name) {
            var fileName = Date.now() + '_' + req.files.logo_name.name;
            var newPath = path.join(process.cwd(), 'uploads/logo', fileName)
            req.files.logo_name.mv(newPath);
            logo_name = fileName;
        }
    }
    else if (req.body.logo_name) {
        logo_name = req.body.logo_name;
    }

    var data = {
        logo_name: logo_name
    }

    console.log(data);

    logoModel.create(data, (err, result) => {
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
    logoModel.show(null, (err, result) => {
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
                        logo_name: i.logo_name ? process.env.logo_path + i.logo_name : '',
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
        logoModel.show(id, (err, result) => {
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
                            logo_name: i.logo_name ? process.env.signature_path + i.logo_name : '',
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

        var logo_name = '';
        var data = {};
        var preFile = '';

        if (req.files) {
            if (req.files.logo_name) {
                var fileName = Date.now() + '_' + req.files.logo_name.name;
                var newPath = path.join(process.cwd(), 'uploads/signature', fileName)
                req.files.logo_name.mv(newPath);
                logo_name = fileName;
            }
        }
        else if (req.body.logo_name) {
            logo_name = req.body.logo_name;

            var tempData = await new Promise(function (resolve, reject) {
                logoModel.show(id, (err, result) => {
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


        if (logo_name) {
            data.certificate_name = logo_name
        }



        logoModel.update(data, id, (err, result) => {
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

                    fs.unlink('uploads/signature/' + preFile, (err) => {
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
            logoModel.show(id, (err, result) => {
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

            logoModel.delete(id, (err, result) => {
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

                    fs.unlink('uploads/signature/' + preFile, (err) => {
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
