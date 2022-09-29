const maintenanceModel = require('../models/maintenanceModel');


exports.create = (req, res) => {

    const { maintenance_text, status, date } = req.body;

    if (maintenance_text && status && date) {

        // data veriable
        var data = {
            maintenance_text: maintenance_text,
            status: status,
            date: date
        }

        var id = req.body.id ? req.body.id : null;

        maintenanceModel.create(data, id, (err, result) => {
            if (err) {
                res.json({
                    status: false,
                    msg: "row not inserted",
                    data: []
                })
            } else {
                res.json({
                    status: false,
                    msg: " Successfully add ",
                    data: result
                })
            }
        })
    } else {
        res.json({
            status: false,
            msg: " all fields are required",
            data: []
        })
    }

}


exports.getAll = (req, res) => {
    maintenanceModel.show((err, result) => {
        if (err) {
            res.json({
                status: false,
                msg: result ? result : "not found",
                data: []
            })
        } else {
            res.json({
                status: true,
                msg: "recored found",
                data: result
            })
        }
    })
}