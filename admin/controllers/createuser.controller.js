const createUserService = require('../services/createuser.service');
const languageService = require("../services/language.service");
const groupService = require('../services/group.service');

const qualificationService = require("../services/qualification.service");
const common = require('./common');

exports.createUser = async (req, res) => {
    if (req.session.loggedin) {
        var msg = req.flash("msg");
        var status = req.flash("status");
        var groupData = await groupService.getAll(req);
        var qualificationData=await qualificationService.getAll(req);
        var languageData=await languageService.getAll(req);
        // console.log(groupData)

        // error msg
        var err_msg = req.session.error;
        var err_type = req.session.err_type;
        req.session.err_type = null;
        req.session.error = null;


        res.render("create-user.ejs", {
            username: common.Capitalize(req.session.username), msg, status, 
            group: groupData.data,
            qualification:qualificationData.data,
            language:languageData.data,
            err_msg: err_msg,
            err_type: err_type
        });
    }
    else {
        res.redirect('/admin/login')
    }
}

exports.postCreateUser = async (req, res) => {
    console.log(req.body)
    var response = await createUserService.create(req);

    // error msg
    if (response.status) {
        req.flash("msg", response.msg);
        req.flash("status", response.data.status)
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    else {
        req.flash("msg", response.msg);
        req.flash("status", response.data.status)
        req.session.error = response.msg
        req.session.err_type = response.status
        
    }

    res.redirect("/create-user");

}

exports.getAllUser = async (req, res) => {
    if (req.session.loggedin) {
        var response = await createUserService.getAllUsers(req);
        var tempData = [];
        // console.log("aaa  "+response)
        response.data.forEach(item => {
            tempData.push({
                role: common.chkUserType(item.role),
                username: `${item.firstname} ${item.lastname}`,
                email: item.email,
                date: new Date(item.created_at).toLocaleDateString(),
                status: item.is_active,
                id: item.id
            })
        });
        console.log(tempData)
        const msg = req.flash("msg");
        const status = req.flash("status");
        res.render("user-list.ejs", { username: req.session.username ? common.Capitalize(req.session.username) : '', result: tempData, req: req, msg, status });

    }
    else {
        res.redirect('/admin/login')
    }
}


exports.statusChange = async (req, res) => {
    //var data=JSON.parse(req.body)
    // console.log(req.body.email);

    if (req.session.loggedin) {
        var response = await createUserService.userStatusChange(req);

        if (response.status) {
            req.flash("msg", response.msg)
            req.flash("status", response.status)
            res.redirect("/user-list");
        }
        else {
            req.flash("msg", response.msg)
            req.flash("status", response.status)
            res.redirect("/user-list");
        }

    }
    else {
        res.redirect('/admin/login')
    }
}

exports.editUser = async (req, res) => {

 
    var response = await createUserService.getUserByID(req);
    var languageRes = await languageService.getAll(req);
    var qualificationRes = await createUserService.qualification(req);
    var groupData = await groupService.getAll(req);

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;



    var msg = req.flash("msg");
    var status = req.flash("status");
    response.data[0].date = common.formatDate(response.data[0].date);
    
    // group details -----------------------------
    console.log("fsdsffsdfd",JSON.stringify(response.data[0].group_details))

    // ---------------------------------------

    res.render('edit-user.ejs', {
        username: common.Capitalize(req.session.username), msg, status,
        group:groupData.data,
        user: response.data[0],
        langData: languageRes.data,
        qualiData: qualificationRes.data,
        err_msg: err_msg,
        err_type: err_type
    });
}

exports.updateUser = async (req, res) => {
    var response = await createUserService.updateUser(req);
    console.log(response)
    var msg = req.flash("msg");
    var status = req.flash("status");
    response.data.date = common.formatDate(response.data.date);
    // console.log(response.data.date)

    // error msg
    if (response.status) {
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    else {
        req.session.error = response.msg
        req.session.err_type = response.status
    }

    res.redirect('/edit-list/' + req.body.id);
}