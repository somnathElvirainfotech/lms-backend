const chspterService = require("../services/chapter.service");
const courseService = require("../services/course.service");
const common = require('./common');


exports.getAll = async (req, res) => {
    var chapter = await chspterService.getAll(req);
    //console.log(chapter.data)
    res.render("chapter-show.ejs", { username: common.Capitalize(req.session.username), result: chapter.data, req: req });

}

exports.create = async (req, res) => {
    var course = await courseService.getAll(req);

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;

    res.render("chapter-create.ejs", {
        username: common.Capitalize(req.session.username), req: req, course: course.data,
        err_msg: err_msg,
        err_type: err_type
    });
}

exports.postCreate = async (req, res) => {
    //alert(req.body)
    var response = await chspterService.create(req);
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


    res.redirect('/chapter/create')
}

exports.edit = async (req, res) => {
    // console.log(req.params.id)
    var course = await courseService.getAll(req);
    var response = await chspterService.getById(req)
    console.log(response.data)

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;

    res.render('chapter-edit.ejs', {
        username: common.Capitalize(req.session.username), req: req,
        course: course.data,
        result: response.data[0],
        err_msg: err_msg,
        err_type: err_type

    })
}

exports.postEdit = async (req, res) => {
    var response = await chspterService.update(req);

    // error msg
    if (response.status) {
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    else {
        req.session.error = response.msg
        req.session.err_type = response.status
    }


    res.redirect('/chapter/edit/' + req.body.id)
}

exports.delete = async (req, res) => {
    var response = await chspterService.delete(req);
    res.redirect('/chapter');
}

exports.courseWiseChapter = async (req, res) => {
    const response = await chspterService.course_chapter(req);
    //console.log(response.data)
    res.send(response);
}