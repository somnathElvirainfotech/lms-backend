module.exports = app => {
    const enrollmentController = require("../controllers/enrollment.controller");
    const loginAuth = require('../middlewares/loginAuth');


    // create user


    // show user 
    app.get('/enrollment', loginAuth, enrollmentController.getAll);
    app.post('/enrollment-search', loginAuth, enrollmentController.enrollmentSearch);
    // app.get('/language/create', loginAuth, lang.create);
    // app.post('/language/create',loginAuth, lang.postCreate);
    // app.get('/language/edit/:id',loginAuth, lang.edit);
    // app.post('/language/edit',loginAuth, lang.postEdit);
    // app.get('/language/delete/:id',loginAuth, lang.delete);

}