module.exports = app => {
    const userSetting = require("../controllers/userSetting.controller");
    const loginAuth = require('../middlewares/loginAuth');


    // create user


    // show user 
    app.get('/userSetting', loginAuth, userSetting.getAll);

}