const userTaskModel = require("../models/userTask.model");

exports.insertUpdate = (req, res) => {

    userTaskModel.updateCreate(req.body, (err, result) => {
        if (err) {
            res.status(200).json({
                status: false,
                msg: result ? result : "create not successfull",
                data: []
            })
        }
        else {

            console.log("okokokokok")
            res.status(200).json({
                status: true,
                msg: "create successfull",
                data: []
            })
        }
    })

}