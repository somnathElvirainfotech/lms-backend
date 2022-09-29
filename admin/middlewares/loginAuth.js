const loginAuth =  (req, res, next) => {
    if (req.session.loggedin) {
        next();
    }
    else {
        res.redirect("/admin/login");
    }
}

module.exports = loginAuth;