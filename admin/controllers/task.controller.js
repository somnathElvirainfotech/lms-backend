const taskService = require("../services/task.service");
const common = require('./common');


exports.getAll = async (req, res) => {
    console.log("fgggggggggggggggggggggggg")
    var response = await taskService.search(req);
    console.log("task data ",response.data);
    res.render("task-show.ejs", { username: common.Capitalize(req.session.username), result: response.data, req: req });
}

exports.download = async (req, res) => {
    var response = await taskService.download(req);
    // console.log("task data records ",JSON.stringify(response.data));
    res.render("task-user-record.ejs", { username: common.Capitalize(req.session.username), result: response.data, req: req });
}