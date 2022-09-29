const chspterService = require("../services/chapter.service");
const courseService = require("../services/course.service");
const lessionService = require("../services/lession.service");
const assignmentService = require("../services/assignment.service");
const groupService = require('../services/group.service');
const common = require('./common');


exports.getAll = async (req, res) => {
    var assignment = await assignmentService.getAll(req);
    //console.log(chapter.data)
    res.render("assignment-show.ejs", { username: common.Capitalize(req.session.username), result: assignment.data, req: req });

}


exports.create = async (req, res) => {
    var course = await courseService.getAll(req);
    var groupData = await groupService.getAll(req);

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;


    res.render("assignment-create.ejs", {
        username: common.Capitalize(req.session.username),
        req: req,
        course: course.data,
        group: groupData.data,
        err_msg: err_msg,
        err_type: err_type
    });
}

exports.postCreate = async (req, res) => {
    //alert(req.body)
    var response = await assignmentService.create(req);
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

    res.redirect('/assignment/create')
}


exports.edit = async (req, res) => {
    // console.log(req.params.id)

    var course = await courseService.getAll(req);
    var response = await assignmentService.getById(req);
    var groupData = await groupService.getAll(req);


    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;


    console.log(response.data)
    res.render('assignment-edit.ejs', {
        username: common.Capitalize(req.session.username),
        req: req,
        course: course.data,
        group: groupData.data,
        result: response.data[0],
        err_msg: err_msg,
        err_type: err_type
    })
}

exports.postEdit = async (req, res) => {
    var response = await assignmentService.update(req);

    // error msg
    if (response.status) {
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    else {
        req.session.error = response.msg
        req.session.err_type = response.status
    }


    res.redirect('/assignment/edit/' + req.body.id)
}

exports.delete = async (req, res) => {
    var response = await assignmentService.delete(req);
    res.redirect('/assignment');
}