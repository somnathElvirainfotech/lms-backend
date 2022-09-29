module.exports = app => {
    const loginAuth = require('../middlewares/loginAuth');
    const category = require('../controllers/category.controller');

    
    // create category
    app.get('/category', loginAuth, category.create);

}