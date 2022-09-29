const qualificationService = require("../services/qualification.service");
const common = require('./common');


exports.getAll = async (req, res) => {
    // console.log('11111111111111111')
    var lang = await qualificationService.getAll(req);
    res.render("qualification-show.ejs", { username: common.Capitalize(req.session.username), result: lang.data, req: req });

}

exports.create = (req, res) => {

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;

    res.render("qualification-create.ejs", {
        username: common.Capitalize(req.session.username), req: req,
        err_msg: err_msg,
        err_type: err_type
    });
}

exports.postCreate = async (req, res) => {
    var response = await qualificationService.create(req);
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


    res.redirect('/qualification/create')
}

exports.edit = async (req, res) => {
    // console.log(req.params.id)
    var response = await qualificationService.getById(req)
    // console.log(response.data)

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;

    res.render('qualification-edit.ejs', {
        username: common.Capitalize(req.session.username), req: req,
        result: response.data[0],
        err_msg: err_msg,
        err_type: err_type
    })
}

exports.postEdit = async (req, res) => {
    var response = await qualificationService.update(req);

    // error msg
    if (response.status) {
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    else {
        req.session.error = response.msg
        req.session.err_type = response.status
    }


    res.redirect('/qualification/edit/' + req.body.id)
}

exports.delete = async (req, res) => {
    var response = await qualificationService.delete(req);
    res.redirect('/qualification');
}