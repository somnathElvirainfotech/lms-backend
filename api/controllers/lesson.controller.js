const lessonController = require('../models/lesson.model');
const { statusMessages } = require('../helper/constant');
const e = require('connect-flash');
const path = require("path");
require("dotenv").config();
const { getVideoDurationInSeconds } = require('get-video-duration')
const axios = require("axios")


function fancyTimeFormat(duration) {
    // Hours, minutes and seconds
    var hrs = ~~(duration / 3600);
    var mins = ~~((duration % 3600) / 60);
    var secs = ~~duration % 60;

    // Output like "1:01" or "4:03:59" or "123:03:59"
    var ret = "";

    if (hrs > 0) {
        ret += "" + hrs + "." + (mins < 10 ? "0" : "");
    }

    ret += "" + mins + "." + (secs < 10 ? "0" : "");
    ret += "" + secs;
    return ret;
}


exports.create = (req, res) => {
    const { lesson_name, course_id, chapter_id, lesson_details, lesson_vedio_type, lesson_no } = req.body;
    var lvedio = '';
    var lfile = '';
    if (lesson_name && course_id && chapter_id && lesson_vedio_type && lesson_no) {


        if (req.files) {
            if (req.files.lesson_file) {
                var fileName = Date.now() + '_' + req.files.lesson_file.name;
                var newPath = path.join(process.cwd(), 'uploads/files', fileName)
                req.files.lesson_file.mv(newPath);
                lfile = fileName;
            }

            if (req.files.lesson_vedio) {
                var fileName = Date.now() + '_' + req.files.lesson_vedio.name;
                var newPath = path.join(process.cwd(), 'uploads/vedios', fileName)
                req.files.lesson_vedio.mv(newPath);
                lvedio = fileName;
            }
        } else {
            lfile = req.body.lesson_file;
            lvedio = req.body.lesson_vedio;
        }


        var ldata = {
            course_id: req.body.course_id,
            chapter_id: req.body.chapter_id,
            lesson_name: req.body.lesson_name,
            lesson_details: req.body.lesson_details,
            lesson_vedio: lvedio,
            lesson_file: lfile,
            lesson_vedio_link: req.body.lesson_vedio_link,
            lesson_vedio_type: req.body.lesson_vedio_type,
            lesson_no: lesson_no
        }

        console.log("lesson data", ldata);

        lessonController.create(ldata, (err, result) => {
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
    lessonController.show(null, (err, result) => {
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
        lessonController.show(id, (err, result) => {
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

exports.update = async (req, res) => {
    const { lesson_name, course_id, chapter_id, id, lesson_details, lesson_no } = req.body;

    var lvedio = '';
    var lfile = '';



    if (id && lesson_name && course_id && chapter_id) {

        if (req.files) {
            if (req.files.lesson_file) {
                var fileName = Date.now() + '_' + req.files.lesson_file.name;
                var newPath = path.join(process.cwd(), 'uploads/files', fileName)
                req.files.lesson_file.mv(newPath);
                lfile = fileName;
            }

            if (req.files.lesson_vedio) {
                var fileName = Date.now() + '_' + req.files.lesson_vedio.name;
                var newPath = path.join(process.cwd(), 'uploads/vedios', fileName)
                req.files.lesson_vedio.mv(newPath);
                lvedio = fileName;
            }
        } else {
            lfile = req.body.lesson_file;
            lvedio = req.body.lesson_vedio;
        }


        var duration = '';
        // From a URL...
        if (req.body.lesson_vedio_type == "link" && req.body.lesson_vedio_link) {


            var url = `http://vimeo.com/api/oembed'json?url=${req.body.lesson_vedio_link}&width=640'`;
            var option = {
                headers: {
                    'Content-Type': 'application/json'
                }
            }

            var vres = await axios.get(url, option);
            console.log("vedio ", vres.data)
            duration = fancyTimeFormat(vres.data.duration)

        } else if (req.body.lesson_vedio_type == "video" && lvedio) {

            // local file
            duration = await getVideoDurationInSeconds(
                process.env.vedios_path + lvedio
            ).then((result) => result)
                .catch((e) => console.log(e))

        }


        const data = {
            lesson_name: lesson_name,
            course_id: course_id,
            chapter_id: chapter_id,
            lesson_details: lesson_details,
            lesson_vedio_link: lvedio ? null : req.body.lesson_vedio_link,
            lesson_vedio_type: req.body.lesson_vedio_type,
            duration: duration


        }


        if (lvedio) {
            data.lesson_vedio = lvedio;
        }

        if (lfile) {
            data.lesson_file = lfile;
        }


        if (req.body.lesson_vedio_link.length > 0 && lvedio.length == 0) {
            data.lesson_vedio = null;
        } else if (lvedio.length > 0) {
            data.lesson_vedio_link = null;
        }


        lessonController.update(data, id, lesson_no, (err, result) => {
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
            msg: statusMessages.allFieldRequired,
            data: []
        })
    }
}


exports.delete = (req, res) => {
    const { id } = req.params;

    if (id) {
        lessonController.delete(id, (err, result) => {
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

exports.getLessonByCreatorId = (req, res) => {
    const { id } = req.params;

    if (id) {
        lessonController.getLessonByCreatorId(id, (err, result) => {
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

exports.lessonSearch = (req, res) => {
    lessonController.search(req.body, (err, result) => {
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