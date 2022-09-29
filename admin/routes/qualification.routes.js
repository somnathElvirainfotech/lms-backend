module.exports = app => {
    const qualification = require("../controllers/qualification.controller");
    const loginAuth = require('../middlewares/loginAuth');


    // create user


    // show user 
    app.get('/qualification', loginAuth, qualification.getAll);
    app.get('/qualification/create', loginAuth, qualification.create);
    app.post('/qualification/create',loginAuth, qualification.postCreate);
    app.get('/qualification/edit/:id',loginAuth, qualification.edit);
    app.post('/qualification/edit',loginAuth, qualification.postEdit);
    app.get('/qualification/delete/:id',loginAuth, qualification.delete);

}