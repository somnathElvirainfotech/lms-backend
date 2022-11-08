const api = require('../helper/constant');
const axios = require('axios');
var FormData = require('form-data');


const Token = require('../helper/header');
const { head } = require('../../api/routes/api.routes');
const header = new Token();

exports.create = async (req) => {
    //const postData = JSON.stringify();
    var formData = new FormData();
    formData.append("c_name", req.body.c_name)
    // formData.append("c_description", req.body.c_description);
    formData.append("c_parent_id", req.body.c_parent_id);
    formData.append("c_status", req.body.c_status);
    // formData.append("c_image", req.files);



    // console.log(formData)
    header.setHeader(req.session.token);

    var response = await axios.post(api.category, formData, header.getHeader());

    return response.data;
}

exports.getAll = async (req) => {
    header.setHeader(req.session.token);

    var response = await axios.get(api.category, header.getHeader());
    return response.data;
}

exports.getOne = async (req) => {

    var id = req.params.id;
    header.setHeader(req.session.token);
    var response = await axios.get(api.category + `/${id}`, header.getHeader());
    return response.data;
}

exports.getParentCategory = async (req) => {

    header.setHeader(req.session.token);
    var response = await axios.get(api.categoryParent, header.getHeader());
    return response.data;
}

exports.getSubCategory = async (req) => {

    header.setHeader(req.session.token);
    var response = await axios.get(api.subCategory, header.getHeader());
    return response.data;
}

exports.update = async (req) => {
    // var postData = JSON.stringify()
    header.setHeader(req.session.token)
    console.log("update  ")
    console.log(req.body)
    var response = await axios.put(api.category, req.body, header.getHeader());

    return response.data;
}

exports.delete = async (req) => {

    var id = req.params.id;
    header.setHeader(req.session.token);
    var response = await axios.delete(api.category + `/${id}`, header.getHeader());
    return response.data;
}


exports.getPraentSubCategory = async (req) => {
    var response = await axios.get(api.praentSubCategory, header.getHeader());
    return response.data;
}

