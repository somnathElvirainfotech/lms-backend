const assigment = require('../models/assignment.model');
const { statusMessages } = require('../helper/constant');
const e = require('connect-flash');
const fs = require('fs');
const { resolve } = require('path');
const { resolveSoa } = require('dns');
const path = require('path')
require('dotenv').config();

exports.create = (req, res) => {
    const { course_id, assigment_desc, assigment_duration, assignment_name, user_group_id, user_id } = req.body;
    var assigment_file = '';
    if (course_id && assigment_desc && assigment_duration && assignment_name && user_group_id && user_id) {

        if (req.files) {
            if (req.files.assigment_file) {
                var fileName = Date.now() + '_' + req.files.assigment_file.name;
                var newPath = path.join(process.cwd(), 'uploads/files', fileName)
                req.files.assigment_file.mv(newPath);
                assigment_file = fileName;
            }
        }
        else if (req.body.assigment_file) {
            assigment_file = req.body.assigment_file;
        }

        const data = {
            course_id: req.body.course_id,
            assigment_desc: req.body.assigment_desc,
            assigment_duration: req.body.assigment_duration,
            assigment_file: assigment_file ? assigment_file : null,
            assignment_name: req.body.assignment_name,
            user_group_id: req.body.user_group_id,
            user_id: req.body.user_id,
        }


        assigment.create(data, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: "assigment not create ",
                    data: []
                })
            } else {
                res.status(200).json({status: true,
                    msg: "assigment create successfull",
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
    assigment.show(null, (err, result) => {
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
                        assignment_name: i.assignment_name,
                        user_group_id: i.user_group_id,
                        group_name: i.g_name,
                        user_id: i.user_id,
                        course_id: i.course_id,
                        course_name: i.course_name,
                        assigment_file: i.assigment_file ? process.env.files_path + i.assigment_file : '',
                        assigment_desc: i.assigment_desc,
                        assigment_duration: i.assigment_duration,
                        assignment_create: formatDate(i.created_at),
                        assignment_deadline: addDays(i.created_at, i.assigment_duration),
                        created_by: i.email,
                        user_name: i.firstname + " " + i.lastname,
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
                    status: true,
                    msg: statusMessages.dataFound,
                    data: result
                })
            }
        }
    })
}

exports.getAssignByCretorId = (req, res) => {
    const { id } = req.params;
    assigment.show(null, (err, result) => {
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

                    if (i.user_id == id) {
                        var temp = {
                            id: i.id,
                            assignment_name: i.assignment_name,
                            user_group_id: i.user_group_id,
                            group_name: i.g_name,
                            user_id: i.user_id,
                            course_id: i.course_id,
                            course_name: i.course_name,
                            course_published_status: i.published_status,
                            courae_approved_status: i.approved_status,
                            assigment_file: i.assigment_file ? process.env.files_path + i.assigment_file : '',
                            assigment_desc: i.assigment_desc,
                            assigment_duration: i.assigment_duration,
                            assignment_create: formatDate(i.created_at),
                            assignment_deadline: addDays(i.created_at, i.assigment_duration),
                            created_by: i.email,
                            user_name: i.firstname + " " + i.lastname,
                            created_at: i.created_at,
                            updated_at: i.updated_at,
                        };

                        tempData.push(temp)
                    }


                }

                res.status(200).json({
                    status: true,
                    msg: statusMessages.dataFound,
                    data: tempData
                })
            }
            else {
                res.status(200).json({
                    status: true,
                    msg: statusMessages.dataFound,
                    data: result
                })
            }
        }
    })
}

exports.getUser = (req, res) => {
    const { id } = req.params;
    if (id) {
        assigment.show(id, (err, result) => {
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
                            assignment_name: i.assignment_name,
                            user_group_id: i.user_group_id,
                            user_id: i.user_id,
                            course_id: i.course_id,
                            assigment_file: i.assigment_file ? process.env.files_path + i.assigment_file : '',
                            assigment_desc: i.assigment_desc,
                            assigment_duration: i.assigment_duration,
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
                        status: true,
                        msg: statusMessages.dataFound,
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
    const { course_id, assigment_desc, assigment_duration, assignment_name, user_group_id, id } = req.body;
    // console.log(req.body)
    console.log("ddddddd");
    console.log(req.body.assigment_file)

    var assigment_file = '';
    var preFile = '';
    if (course_id && assigment_desc && assigment_duration && assignment_name && user_group_id) {

        if (req.files) {
            if (req.files.assigment_file) {
                var fileName = Date.now() + '_' + req.files.assigment_file.name;
                var newPath = path.join(process.cwd(), 'uploads/files', fileName)
                req.files.assigment_file.mv(newPath);
                assigment_file = fileName;
            }
        }
        else if (req.body.assigment_file) {
            assigment_file = req.body.assigment_file;
        }

        const data = {
            course_id: req.body.course_id,
            assigment_desc: req.body.assigment_desc,
            assigment_duration: req.body.assigment_duration,
            assignment_name: req.body.assignment_name,
            user_group_id: req.body.user_group_id,
        }

        if (assigment_file) {
            data.assigment_file = assigment_file;

            var tempData = await new Promise(function (resolve, reject) {
                assigment.show(id, (err, result) => {
                    if (err) throw err;

                    if (result.length > 0) {
                        resolve(result)
                    } else {
                        resolve(null)
                    }
                })
            })

            //console.log("hhhhhh")
            preFile = tempData[0].assigment_file;


        }

        //onsole.log(preImg)



        assigment.update(data, id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: statusMessages.notUpdate,
                    data: []
                })
            }
            else {
                console.log(preFile);
                if (preFile) {

                    fs.unlink('uploads/files/' + preFile, (err) => {
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
            msg: "id and " + statusMessages.allFieldRequired,
            data: []
        })
    }
}


exports.delete = async (req, res) => {
    const { id } = req.params;

    var preFile = '';

    if (id) {

        var tempData = await new Promise(function (resolve, reject) {
            assigment.show(id, (err, result) => {
                if (err) throw err;

                if (result.length > 0) {
                    resolve(result)
                } else {
                    resolve(null)
                }
            })
        })

        //console.log("hhhhhh")
        preFile = tempData[0].assigment_file;


        assigment.delete(id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: result != null ? result : "not delete",
                    data: []
                })
            }
            else {



                if (preFile) {
                    fs.unlink('uploads/files/' + preFile, (err) => {
                        if (err) throw err;

                        console.log("file delete");
                    })
                }

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


exports.getByCourseId = (req, res) => {
    const { course_id, user_id } = req.body;
    if (course_id && user_id) {
        assigment.getByCourseId(course_id, user_id, (err, result) => {
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
                            assignment_name: i.assignment_name,
                            user_group_id: i.user_group_id,
                            group_name: i.g_name,
                            user_id: i.user_id,
                            course_id: i.course_id,
                            course_name: i.course_name,
                            assigment_file: i.assigment_file ? process.env.files_path + i.assigment_file : '',
                            assigment_desc: i.assigment_desc,
                            assigment_duration: i.assigment_duration,
                            assignment_create: formatDate(i.created_at),
                            assignment_deadline: addDays(i.created_at, i.assigment_duration),
                            created_by: i.email,
                            user_name: i.firstname + " " + i.lastname,
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
                        status: true,
                        msg: statusMessages.dataFound,
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


exports.getAllEnrollAssignmentByUserId = (req, res) => {
    const { id } = req.params;

    if (id) {
        assigment.getAllEnrollAssignmentByUserId(id, async (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: statusMessages.dataNotFound,
                    data: []
                })
            }
            else {


                if (result.length > 0) {

                    await new Promise((resolve, reject) => {
                        var tempData = [];
                        //console.log(result);
                        for (var i of result) {
                            if (i != undefined) {
                                var temp = {
                                    id: i.id,
                                    assignment_name: i.assignment_name,
                                    user_group_id: i.user_group_id,
                                    group_name: i.g_name,
                                    user_id: i.user_id,
                                    course_id: i.course_id,
                                    course_name: i.course_name,
                                    assigment_file: i.assigment_file ? process.env.files_path + i.assigment_file : '',
                                    assigment_desc: i.assigment_desc,
                                    assigment_duration: i.assigment_duration,
                                    assignment_create: formatDate(i.created_at),
                                    assignment_deadline: addDays(i.created_at, i.assigment_duration),
                                    created_by: i.email,
                                    user_name: i.firstname + " " + i.lastname,
                                    created_at: i.created_at,
                                    updated_at: i.updated_at,
                                };

                                tempData.push(temp)
                            }
                        }

                        resolve(tempData)

                        res.status(200).json({
                            status: true,
                            msg: statusMessages.dataFound,
                            data: tempData
                        })
                    })




                }
                else {
                    res.status(200).json({
                        status: true,
                        msg: statusMessages.dataFound,
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

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2)
        month = '0' + month;
    if (day.length < 2)
        day = '0' + day;

    return [year, month, day].join('-');
}

function addDays(date, days) {
    var result = new Date(date);
    result.setDate(result.getDate() + (days - 1));
    //return result;

    var d = result
    month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2)
        month = '0' + month;
    if (day.length < 2)
        day = '0' + day;

    return [year, month, day].join('-');
}