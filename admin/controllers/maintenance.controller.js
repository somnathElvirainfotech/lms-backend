const common = require('./common');
const maintenanceService = require('../services/maintenance.service');



exports.getAll = async (req, res) => {
    // console.log('11111111111111111')

    // error msg
    var err_msg = req.session.error;
    var err_type = req.session.err_type;
    req.session.err_type = null;
    req.session.error = null;

    var response = await maintenanceService.getAll(req);
    console.log("mamamam    ", response);


    var result = {};
    if (response.status) {
        result = {
            maintenance_text: response.data[0].maintenance_text,
            status: response.data[0].status,
            date: formatDate(new Date(response.data[0].date)),
            id: response.data[0].id
        }
    } else {
        result = {
            maintenance_text: "maintenance text ...",
            status: "",
            date: "",
            id: ""
        }
    }


    res.render("maintenance-mode.ejs", {
        username: common.Capitalize(req.session.username),
        result: result,
        req: req,
        err_msg: err_msg,
        err_type: err_type
    });

}

exports.create = async (req, res) => {

    console.log(req.body);
    var response = await maintenanceService.create(req);
    //console.log(response);

    // error msg
    if (response.status) {
        req.session.error = response.msg
        req.session.err_type = response.status
    }
    else {
        req.session.error = response.msg
        req.session.err_type = response.status
    }


    res.redirect('/maintenance')
}


function padTo2Digits(num) {
    return num.toString().padStart(2, '0');
}

function formatDate(date) {
    return (
        [
            date.getFullYear(),
            padTo2Digits(date.getMonth() + 1),
            padTo2Digits(date.getDate()),
        ].join('-') +
        ' ' +
        [
            padTo2Digits(date.getHours()),
            padTo2Digits(date.getMinutes()),
            // padTo2Digits(date.getSeconds()),  // 👈️ can also add seconds
        ].join(':')
    );
}