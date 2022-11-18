const common = require('./common');

exports.result=(req,res)=>{
    res.render("result.ejs",{ username: common.Capitalize(req.session.username), req: req })
}