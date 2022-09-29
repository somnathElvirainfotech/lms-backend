const qualificationService = require("../services/qualification.service");
const common = require('./common');


exports.getAll = async (req, res) => {
    // console.log('11111111111111111')
    
    res.render("user-setting.ejs", { username: common.Capitalize(req.session.username), req: req,res:res });

}

