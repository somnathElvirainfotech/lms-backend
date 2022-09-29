const chspterService = require("../services/chapter.service");
const courseService = require("../services/course.service");
const lessionService = require("../services/lession.service");
const common = require('./common');


exports.getAll = async (req, res) => {
    var lesson = await lessionService.getAll(req);
    //console.log(chapter.data)
    res.render("lesson-show.ejs", { username: common.Capitalize(req.session.username), result: lesson.data, req: req });

}

exports.create = async (req, res) => {
    var course = await courseService.getAll(req);
    // var chapter = await chspterService.getAll(req);

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;


    res.render("lesson-create.ejs", {
        username: common.Capitalize(req.session.username),
        req: req,
        course: course.data,
        chapter: [],
        err_msg: err_msg,
        err_type: err_type
    });
}

exports.postCreate = async (req, res) => {
    //alert(req.body)
    var response = await lessionService.create(req);
    //console.log(response);

    // error msg
    if (response.status) {
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    else {
        req.session.error = response.msg
        req.session.err_type = response.status
    }

    res.redirect('/lesson/create')
}

exports.edit = async (req, res) => {
    // console.log(req.params.id)

    var course = await courseService.getAll(req);
    var response = await lessionService.getById(req)

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;


    console.log(response.data)
    res.render('lesson-edit.ejs', {
        username: common.Capitalize(req.session.username),
        req: req,
        course: course.data,
        chapter: [],
        result: response.data[0],
        err_msg: err_msg,
        err_type: err_type
    })
}

exports.postEdit = async (req, res) => {
    var response = await lessionService.update(req);

    // error msg
    if (response.status) {
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    else {
        req.session.error = response.msg
        req.session.err_type = response.status
    }


    res.redirect('/lesson/edit/' + req.body.id)
}

exports.delete = async (req, res) => {
    var response = await lessionService.delete(req);
    res.redirect('/chapter');
}