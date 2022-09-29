module.exports = app => {
    const lang = require("../controllers/language.controller");
    const loginAuth = require('../middlewares/loginAuth');


    // create user


    // show user 
    app.get('/language', loginAuth, lang.getAll);
    app.get('/language/create', loginAuth, lang.create);
    app.post('/language/create',loginAuth, lang.postCreate);
    app.get('/language/edit/:id',loginAuth, lang.edit);
    app.post('/language/edit',loginAuth, lang.postEdit);
    app.get('/language/delete/:id',loginAuth, lang.delete);

}