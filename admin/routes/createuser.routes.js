module.exports = app => {
    const user = require("../controllers/createuser.controller");
    const loginAuth = require('../middlewares/loginAuth');


    // create user
    app.get('/create-user', loginAuth, user.createUser);
    app.post('/create-user', loginAuth, user.postCreateUser);

    // show user
    app.get('/user-list', loginAuth, user.getAllUser);
    app.post('/user-status', loginAuth, user.statusChange);

    // edit user details
    app.get('/edit-list', loginAuth, user.editUser);
    app.post('/edit-list', loginAuth, user.updateUser);
}