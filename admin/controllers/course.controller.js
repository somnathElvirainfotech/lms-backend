const courseService = require('../services/course.service');
const groupService = require('../services/group.service');
const categoriService = require('../services/category.service');
const langService = require('../services/language.service');
const common = require('./common');
const fs=require('fs');


exports.create = async (req, res) => {

    var msg = req.flash("msg");
    var status = req.flash("status");
    var groupData = await groupService.getAll(req);
    var langData = await langService.getAll(req);
    //var categoryData = await categoriService.getParentCategory(req);
    var categoryData = await categoriService.getPraentSubCategory(req);
    var subCategory = await categoriService.getSubCategory(req);

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null


    // console.log(groupData)
    res.render("course-create.ejs", {
        username: common.Capitalize(req.session.username), msg, status, group: groupData.data,
        lang: langData.data, category: categoryData.data, subCategory: subCategory.data,
        err_msg: err_msg,
        err_type: err_type
    });

}


exports.postCreate = async (req, res) => {
    //console.log(req.body)
    var response = await courseService.create(req);

    // error msg
    if (response.status) {
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    else {
        req.session.error = response.msg
        req.session.err_type = response.status
    }

    res.redirect("/course/create")

}


exports.getAll = async (req, res) => {
    if (req.session.loggedin) {
        var response = await courseService.getAll(req);

        const msg = req.flash("msg");
        const status = req.flash("status");
        res.render("course-show.ejs", { username: req.session.username ? common.Capitalize(req.session.username) : '', result: response.data, req: req, msg, status });

    }
    else {
        res.redirect('/admin/login')
    }
}


exports.edit = async (req, res) => {
    var response = await courseService.getOne(req)
    console.log(response.data)
    var groupData = await groupService.getAll(req);
    var langData = await langService.getAll(req);
    // var categoryData = await categoriService.getParentCategory(req);
    var categoryData = await categoriService.getPraentSubCategory(req);
    var subCategory = await categoriService.getSubCategory(req);

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;

    res.render('course-edit.ejs', {
        username: common.Capitalize(req.session.username), req: req,
        result: response.data[0], group: groupData.data, lang: langData.data, category: categoryData.data,
        subCategory: subCategory.data,
        err_msg: err_msg,
        err_type: err_type
    })
}

exports.postEdit = async (req, res) => {

    var response = await courseService.update(req);


    // error msg
    if (response.status) {
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    else {
        req.session.error = response.msg
        req.session.err_type = response.status
    }

    res.redirect(`/course/edit/${req.body.id}`)
}


exports.delete = async (req, res) => {
    var response = await courseService.delete(req);
    res.redirect('/course');
}

exports.approveStatus = async (req, res) => {
    // console.log(req.body)
    await courseService.approveStatus(req);
}