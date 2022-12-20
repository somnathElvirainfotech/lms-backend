const { statusMessages } = require('../helper/constant');

const testModel = require('../models/testModel');



module.exports.read = (req, res) => {
    testModel.read(null, function (data) {
        res.status(200).json({
            status: false,
            msg: data.length ? statusMessages.dataFound : statusMessages.dataNotFound,
            data: data.length ? data : []
        })
    })
}