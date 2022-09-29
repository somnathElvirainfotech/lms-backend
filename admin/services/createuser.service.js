const api = require('../helper/constant');
const axios = require('axios');

const Token = require('../helper/header');
const { head } = require('../../api/routes/api.routes');
const header = new Token();

exports.create = async (req) => {
    req.body.status = 1;
    var postData = JSON.stringify(req.body);
    header.setHeader(req.session.token);

    var response = await axios.post(api.create_user, postData, header.getHeader());

    return response.data;
}

exports.getAllUsers = async (req) => {

    header.setHeader(req.session.token);

    var response = await axios.get(api.get_all_user, header.getHeader());

    return response.data;
}


exports.userStatusChange = async (req) => {
    // const {emai,status}=req.body;
    var postData = JSON.stringify(req.body);
    header.setHeader(req.session.token);
    var response = await axios.post(api.get_all_user + '/status', postData, header.getHeader());

    return response.data;
}

exports.updateUser = async (req) => {
    // const {emai,status}=req.body;
    var postData = JSON.stringify(req.body);
    
    header.setHeader(req.session.token);
    var response = await axios.put(api.update_user, postData, header.getHeader());

    return response.data;
}

exports.getUser = async (req) => {
    // const {emai,status}=req.body;
    console.log(req.query.email)
    var postData = JSON.stringify({
        email: req.query.email
    });
    header.setHeader(req.session.token);
    var response = await axios.post(api.update_user, postData, header.getHeader());

    return response.data;
}




exports.qualification = async (req) => {
    // console.log(api.language)
    header.setHeader(req.session.token);
    var response = await axios.get(api.qualification, header.getHeader());
    return response.data;
}



