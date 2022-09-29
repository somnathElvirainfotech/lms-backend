module.exports = app => {
    const admin = require("../controllers/admin.controller");
    const loginAuth=require('../middlewares/loginAuth');
    const userChk=require("../middlewares/userChk");



    // dashboard
    app.get('/admin',loginAuth,admin.index); 

    // login & logout & register
    app.get('/admin/register',userChk, admin.register);
    app.post('/admin/register',userChk, admin.postregister);
    app.get('/admin/login',userChk, admin.login);
    app.post('/admin/login',userChk, admin.postlogin);
    app.get('/admin/logout',loginAuth,admin.logout);

    // csv file upload
    app.post('/admin/user-csv',loginAuth,admin.userCsvUpload);

}