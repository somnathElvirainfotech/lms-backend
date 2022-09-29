const groupService = require("../services/group.service");
const common = require('./common');


exports.getAll = async (req, res) => {
    var lang = await groupService.getAll(req);
    console.log(lang.data)
    res.render("group-show.ejs", { username: common.Capitalize(req.session.username), result: lang.data, req: req });

}

exports.create = (req, res) => {

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;

    res.render("group-create.ejs", {
        username: common.Capitalize(req.session.username), req: req,
        err_msg: err_msg,
        err_type: err_type
    });
}

exports.postCreate = async (req, res) => {
    var response = await groupService.create(req);
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


    res.redirect('/group/create')
}

exports.edit = async (req, res) => {
    // console.log(req.params.id)
    var response = await groupService.getById(req)
    // console.log(response.data)

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;


    res.render('group-edit.ejs', {
        username: common.Capitalize(req.session.username), req: req,
        result: response.data[0],
        err_msg: err_msg,
        err_type: err_type
    })
}

exports.postEdit = async (req, res) => {
    var response = await groupService.update(req);

    // error msg
    if (response.status) {
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    else {
        req.session.error = response.msg
        req.session.err_type = response.status
    }


    res.redirect('/group/edit/' + req.body.id)
}

exports.delete = async (req, res) => {
    var response = await groupService.delete(req);
    res.redirect('/group');
}