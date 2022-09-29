module.exports = app => {
    const assignment = require("../controllers/assignment.controller");
    const loginAuth = require('../middlewares/loginAuth');


    // create user


    // show user 
   app.get('/assignment', loginAuth, assignment.getAll);
    app.get('/assignment/create', loginAuth, assignment.create);
    app.post('/assignment/create',loginAuth, assignment.postCreate);
    app.get('/assignment/edit/:id',loginAuth, assignment.edit);
    app.post('/assignment/edit',loginAuth, assignment.postEdit);
    app.get('/assignment/delete/:id',loginAuth, assignment.delete);

}