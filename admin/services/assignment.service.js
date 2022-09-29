const api = require('../helper/constant');
const axios = require('axios');
var FormData = require('form-data');
const Token = require('../helper/header');
const { head } = require('../../api/routes/api.routes');
const header = new Token();
const path = require('path')

exports.getAll = async (req) => {
    // console.log(api.language)
    header.setHeader(req.session.token);
    var response = await axios.get(api.assignment, header.getHeader());
    return response.data;
}


exports.getById = async (req) => {
    const { id } = req.params;
    header.setHeader(req.session.token);
    const response = await axios.get(api.assignment + "/" + id, header.getHeader());
    return response.data;
}

exports.create = async (req) => {

    var assigment_file = '';
    if (req.files) {
        if (req.files.assigment_file) {
            var exten = path.parse(req.files.assigment_file.name);
            assigment_file = Date.now() + '_' + "lms_document" + exten.ext;
            // fileName=fileName.replaceAll(" ","-");
            var newPath = path.join(process.cwd(), 'uploads/files', assigment_file)
            req.files.assigment_file.mv(newPath);
        }
    }



    var formData = new FormData();

    formData.append("course_id", req.body.course_id)
    formData.append("assigment_duration", req.body.assigment_duration)
    formData.append("assigment_desc", req.body.assigment_desc)
    formData.append("assigment_file", assigment_file)
    formData.append("assignment_name", req.body.assignment_name)
    formData.append("user_group_id", req.body.user_group_id)
    formData.append("user_id", req.session.user_id)


    header.setHeader(req.session.token);
    const response = await axios.post(api.assignment, formData, header.getHeader());
    console.log(response.data)
    return response.data;
}

exports.update = async (req) => {
    var assigment_file = '';
    if (req.files) {
        if (req.files.assigment_file) {
            var exten = path.parse(req.files.assigment_file.name);
            assigment_file = Date.now() + '_' + "lms_document" + exten.ext;
            // fileName=fileName.replaceAll(" ","-");
            var newPath = path.join(process.cwd(), 'uploads/files', assigment_file)
            req.files.assigment_file.mv(newPath);
        }
    }



    var formData = new FormData();



    formData.append("id", req.body.id)
    formData.append("course_id", req.body.course_id)
    formData.append("assigment_duration", req.body.assigment_duration)
    formData.append("assigment_desc", req.body.assigment_desc)
    formData.append("assigment_file", assigment_file)
    formData.append("assignment_name", req.body.assignment_name)
    formData.append("user_group_id", req.body.user_group_id)
    //formData.append("user_id", req.body.user_id)


    header.setHeader(req.session.token);
    const response = await axios.put(api.assignment, formData, header.getHeader());
    return response.data;
}

exports.delete = async (req) => {
    const { id } = req.params;
    header.setHeader(req.session.token);
    const response = await axios.delete(api.assignment + "/" + id, header.getHeader());
    return response.data;
}