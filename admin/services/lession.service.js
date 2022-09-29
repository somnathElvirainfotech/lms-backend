const api = require('../helper/constant');
const axios = require('axios');
const FormData = require('form-data');

const Token = require('../helper/header');
const { head } = require('../../api/routes/api.routes');
const header = new Token();

const path = require('path');

exports.getAll = async (req) => {
    // console.log(api.language)
    header.setHeader(req.session.token);
    var response = await axios.get(api.lesson, header.getHeader());
    return response.data;
}

exports.getById = async (req) => {
    const { id } = req.params;
    header.setHeader(req.session.token);
    const response = await axios.get(api.lesson + "/" + id, header.getHeader());
    return response.data;
}



exports.create = async (req) => {

    var lvedio = '';
    var lfile = '';

    if (req.files) {
        if (req.files.lesson_file) {
            var exten = path.parse(req.files.lesson_file.name);
            var fileName = Date.now() + '_' + "lms_document" + exten.ext;
            var newPath = path.join(process.cwd(), 'uploads/files', fileName)
            req.files.lesson_file.mv(newPath);
            lfile = fileName;
        }

        if (req.files.lesson_vedio) {
            var exten = path.parse(req.files.lesson_vedio.name);
            var fileName = Date.now() + '_' + "lms_document" + exten.ext;
            var newPath = path.join(process.cwd(), 'uploads/vedios', fileName)
            req.files.lesson_vedio.mv(newPath);
            lvedio = fileName;
        }
    }


    var formData = new FormData();

    formData.append("lesson_name", req.body.lesson_name);
    formData.append("course_id", req.body.course_id);
    formData.append("chapter_id", req.body.chapter_id);
    formData.append("lesson_details", req.body.lesson_details);
    formData.append("lesson_vedio", lvedio);
    formData.append("lesson_file", lfile);



    header.setHeader(req.session.token);
    const response = await axios.post(api.lesson, formData, header.getHeader());
    return response.data;
}

exports.update = async (req) => {

    var lvedio = '';
    var lfile = '';

    if (req.files) {
        if (req.files.lesson_file) {
            var exten = path.parse(req.files.lesson_file.name);
            var fileName = Date.now() + '_' + "lms_document" + exten.ext;
            var newPath = path.join(process.cwd(), 'uploads/files', fileName)
            req.files.lesson_file.mv(newPath);
            lfile = fileName;
        }

        if (req.files.lesson_vedio) {
            var exten = path.parse(req.files.lesson_vedio.name);
            var fileName = Date.now() + '_' + "lms_document" + exten.ext;
            var newPath = path.join(process.cwd(), 'uploads/vedios', fileName)
            req.files.lesson_vedio.mv(newPath);
            lvedio = fileName;
        }
    }


    var formData = new FormData();

    formData.append("id", req.body.id);
    formData.append("lesson_name", req.body.lesson_name);
    formData.append("course_id", req.body.course_id);
    formData.append("chapter_id", req.body.chapter_id);
    formData.append("lesson_vedio", lvedio);
    formData.append("lesson_file", lfile);
    formData.append("lesson_details", req.body.lesson_details)

    header.setHeader(req.session.token);
    const response = await axios.put(api.lesson, formData, header.getHeader());
    return response.data;
}

exports.delete = async (req) => {
    const { id } = req.params;
    header.setHeader(req.session.token);
    const response = await axios.delete(api.lesson + "/" + id, header.getHeader());
    return response.data;
}