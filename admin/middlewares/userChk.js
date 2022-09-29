const userChk=(req,res,next)=>{
        if(!req.session.loggedin)
        {
            next();
        }
        else{
            res.redirect("/admin")
        }
}

module.exports=userChk;