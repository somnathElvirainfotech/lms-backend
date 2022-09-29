const categoryService = require('../services/category.service');
const common = require('./common');

exports.create = async (req, res) => {
    // var response = await categoryService.getParentCategory(req)
    // console.log(response);
    var msg = req.flash("msg");
    var status = req.flash("status");
    var response = await categoryService.getPraentSubCategory(req);

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;


    res.render("category-create.ejs", {
        username: req.session.username ? common.Capitalize(req.session.username) : "",
        msg, status, result: response.data,
        err_msg: err_msg,
        err_type: err_type
    });
}

exports.postCreate = async (req, res) => {
    req.body.c_status = "active"

    var response = await categoryService.create(req);

    // error msg
    if (response.status) {
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    else {
        req.session.error = response.msg
        req.session.err_type = response.status
    }

    res.redirect("/category/create");
}




exports.show = async (req, res) => {
    var response = await categoryService.getAll(req);
    var msg = req.flash("msg");
    var status = req.flash("status");
    res.render("category-show.ejs", {
        username: req.session.username ? common.Capitalize(req.session.username) : "",
        msg, status, result: response.data, req: req
    });

}

exports.edit = async (req, res) => {
    var msg = req.flash("msg");
    var status = req.flash("status");
    var response = await categoryService.getOne(req);
    // var response2 = await categoryService.getParentCategory(req)
    var response2 = await categoryService.getPraentSubCategory(req);
    console.log(response.data[0])

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;


    res.render("category-edit.ejs", {
        username: req.session.username ? common.Capitalize(req.session.username) : "",
        msg, status, result: response.data[0], result2: response2.data,
        err_msg: err_msg,
        err_type: err_type
    })
}

exports.postEdit = async (req, res) => {
    var response = await categoryService.update(req);
    // error msg
    if (response.status) {
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    else {
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    res.redirect(`/category/edit/${req.body.id}`)
}

exports.delete = async (req, res) => {

    const response = await categoryService.delete(req);
    console.log(response.data)
    res.redirect('/category')
}