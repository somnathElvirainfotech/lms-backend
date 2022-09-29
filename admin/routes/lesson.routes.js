module.exports = app => {
    const lesson = require("../controllers/lesson.controller");
    const loginAuth = require('../middlewares/loginAuth');


    // create user


    // show user 
    app.get('/lesson', loginAuth, lesson.getAll);
    app.get('/lesson/create', loginAuth, lesson.create);
    app.post('/lesson/create', loginAuth, lesson.postCreate);
    app.get('/lesson/edit/:id', loginAuth, lesson.edit);
    app.post('/lesson/edit', loginAuth, lesson.postEdit);
    app.get('/lesson/delete/:id', loginAuth, lesson.delete);

}