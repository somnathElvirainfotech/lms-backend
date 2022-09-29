const enrollmentService = require("../services/enrollment.service");
const common = require('./common');
const courseService = require('../services/course.service');


exports.getAll = async (req, res) => {
    var enrollment = await enrollmentService.getAll(req);
    var course = await courseService.getAll(req);
    res.render("enrollment-show.ejs", { username: common.Capitalize(req.session.username), result: enrollment.data, req: req,course:course.data });

}

exports.enrollmentSearch = async (req, res) => {
    var enrollment = await enrollmentService.getAll(req);
    res.json({
        result: enrollment.data,
    })

}


exports.delete = async (req, res) => {
    var response = await enrollmentService.delete(req);
    res.redirect('/language');
}