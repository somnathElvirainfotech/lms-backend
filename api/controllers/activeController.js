var activetyModel = require('../models/activityModel');

exports.Search = (req, res) => {
    const { searchType } = req.body;
    if (searchType) {
        activetyModel.Search(req.body, (err, result) => {
            if (err) {  
                res.status(200).json({
                    status: false,
                    msg: "not found",
                    data: []
                })
            } else {
                res.status(200).json({
                    status: true,
                    msg: "data found",
                    data: result
                })
            }
        })
    } else {
        res.status(200).json({
            status: false,
            msg: "search type must required",
            data: []
        })
    }

}