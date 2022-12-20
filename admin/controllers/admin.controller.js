const adminService = require('../services/admin.services');
const common = require('./common');



exports.register = (req, res) => {

    const smsg = req.flash("smsg");
    const emsg = req.flash("emsg");
    res.render("register.ejs", { smsg, emsg })

}


exports.postregister = async (req, res) => {


    const response = await adminService.register(req.body);

    if (response.status) {
        req.flash("smsg", response.msg);
        res.redirect("/admin/register")
        console.log("ok")
    }
    else {
        req.flash("emsg", response.msg);
        res.redirect("/admin/register")
        console.log("not ok")
    }

};


exports.index = async(req, res) => {
     var dashboard= await adminService.dashboard(req);
     console.log("dashboard ",dashboard);
    res.render("index.ejs", { 
        username: req.session.username?common.Capitalize(req.session.username):"",
         dashboard:dashboard.data,
     });
    

};


exports.login = (req, res) => {

    const msg = req.flash('msg');
    res.render("login.ejs", { msg });

};


exports.postlogin = async (req, res) => {

    const response = await adminService.login(req.body)

    console.log("login data ",response)

    if (response.status) {
        req.session.token = response.token;
        req.session.loggedin = true;
        req.session.username = response.data.firstname;
        req.session.email = response.data.email;
        req.session.user_id = response.data.id;
        req.session.role = response.data.role;
       // req.flash('username', common.Capitalize(response.data.firstname))
        res.redirect("/admin");
    }
    else {

        req.flash('msg', response.msg);
        res.redirect("/admin/login");
    }


};



exports.logout = (req, res) => {
    req.session.destroy();
    res.redirect("/admin/login");
   // res.redirect(req.get('referer'));
//    res.location("/",)
}


exports.userCsvUpload=async(req,res)=>{

    const response=await adminService.userCsvUpload(req);
    res.redirect('/create-user');
}


