module.exports = app => {
    const chapter = require("../controllers/chapter.controller");
    const loginAuth = require('../middlewares/loginAuth');


    // create user


    // show user 
    app.get('/chapter', loginAuth, chapter.getAll);
    app.get('/chapter/create', loginAuth, chapter.create);
    app.post('/chapter/create', loginAuth, chapter.postCreate);
    app.get('/chapter/edit/:id', loginAuth, chapter.edit);
    app.post('/chapter/edit', loginAuth, chapter.postEdit);
    app.get('/chapter/delete/:id', loginAuth, chapter.delete);
    app.get('/course/chapter/:id', loginAuth, chapter.courseWiseChapter)

}