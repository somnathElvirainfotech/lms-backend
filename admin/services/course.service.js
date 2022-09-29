const api = require('../helper/constant');
const axios = require('axios');
var FormData = require('form-data');
const fs = require('fs');


const Token = require('../helper/header');
const { head } = require('../../api/routes/api.routes');
const path = require('path');
const { admin_api_url } = require('../helper/constant');
const header = new Token();

exports.create = async (req) => {
    //const postData = JSON.stringify();

    var fileName = '';
    var fileName2 = '';
    var fileName3 = '';

    if (req.files) {
        if (req.files.image) {
            var exten = path.parse(req.files.image.name);
            fileName = Date.now() + '_' + "lms_document" + exten.ext;
            // fileName=fileName.replaceAll(" ","-");
            var newPath = path.join(process.cwd(), 'uploads/images', fileName)
            req.files.image.mv(newPath);
        }

        if (req.files.avatar_image) {
            var exten = path.parse(req.files.avatar_image.name);
            fileName2 = Date.now() + '_' + "lms_document" + exten.ext;
            //fileName2=fileName2.replaceAll(" ","-");
            var newPath2 = path.join(process.cwd(), 'uploads/images', fileName2)
            req.files.avatar_image.mv(newPath2);
        }

        if (req.files.attachment_file) {
            var exten = path.parse(req.files.attachment_file.name);
            fileName3 = Date.now() + '_' + "lms_document" + exten.ext;
            //fileName3=fileName3.replaceAll(" ","-");
            var newPath3 = path.join(process.cwd(), 'uploads/images', fileName3)
            req.files.attachment_file.mv(newPath3);
        }
    }

    console.log(req.body)

    var formData = new FormData();
    console.log(req.session)
    formData.append("user_id", req.session.user_id)
    formData.append("sub_category_id", req.body.sub_category_id ? req.body.sub_category_id : '');
    formData.append("course_name", req.body.course_name)
    formData.append("short_description", req.body.short_description);
    formData.append("group_id", req.body.group_id);
    formData.append("category_id", req.body.category_id);
    formData.append("published_status", req.body.published_status);
    formData.append("course_level", req.body.course_level);
    formData.append("lang", req.body.lang);
    formData.append("image", fileName);
    formData.append("avatar_image", fileName2);
    formData.append("attachment_file", fileName3);




    //    var img=req.files.image;



    //        console.log(img.path)
    header.setHeader(req.session.token);

    var response = await axios.post(api.course, formData, header.getHeader());
    console.log(response.data.msg)
    return response.data;
}

exports.getAll = async (req) => {
    header.setHeader(req.session.token);

    var response = await axios.get(api.course, header.getHeader());
    return response.data;
}

exports.getOne = async (req) => {

    var id = req.params.id;
    header.setHeader(req.session.token);
    var response = await axios.get(api.course + `/${id}`, header.getHeader());
    return response.data;
}

exports.getParentCategory = async (req) => {

    header.setHeader(req.session.token);
    var response = await axios.get(api.categoryParent, header.getHeader());
    return response.data;
}

exports.update = async (req) => {
    // var postData = JSON.stringify()
    var fileName = '';
    var fileName2 = '';
    var fileName3 = '';
    if (req.files) {
        if (req.files.image) {
            var exten = path.parse(req.files.image.name);
            fileName = Date.now() + '_' + "lms_document" + exten.ext;
            // fileName=fileName.replaceAll(" ","-");
            var newPath = path.join(process.cwd(), 'uploads/images', fileName)
            req.files.image.mv(newPath);
        }

        if (req.files.avatar_image) {
            var exten = path.parse(req.files.avatar_image.name);
            fileName2 = Date.now() + '_' + "lms_document" + exten.ext;
            //fileName2=fileName2.replaceAll(" ","-");
            var newPath2 = path.join(process.cwd(), 'uploads/images', fileName2)
            req.files.avatar_image.mv(newPath2);
        }

        if (req.files.attachment_file) {
            var exten = path.parse(req.files.attachment_file.name);
            fileName3 = Date.now() + '_' + "lms_document" + exten.ext;
            //fileName3=fileName3.replaceAll(" ","-");
            var newPath3 = path.join(process.cwd(), 'uploads/images', fileName3)
            req.files.attachment_file.mv(newPath3);
        }
    }


    var formData = new FormData();

    formData.append("sub_category_id", req.body.sub_category_id ? req.body.sub_category_id : '');
    formData.append("course_name", req.body.course_name ? req.body.course_name : '')
    formData.append("short_description", req.body.short_description ? req.body.short_description : '');
    formData.append("group_id", req.body.group_id ? req.body.group_id : '');
    formData.append("category_id", req.body.category_id ? req.body.category_id : '');
    formData.append("published_status", req.body.published_status ? req.body.published_status : '');
    formData.append("course_level", req.body.course_level ? req.body.course_level : '');
    formData.append("lang", req.body.lang ? req.body.lang : '');
    formData.append("image", fileName);
    formData.append("avatar_image", fileName2);
    formData.append("attachment_file", fileName3);
    formData.append("id", req.body.id);


    header.setHeader(req.session.token)
    console.log(formData)
    // console.log(req.body)
    var response = await axios.put(api.course, formData, header.getHeader());

    return response.data;
}

exports.delete = async (req) => {

    var id = req.params.id;
    header.setHeader(req.session.token);
    var response = await axios.delete(api.course + `/${id}`, header.getHeader());
    return response.data;
}

exports.approveStatus = async (req) => {
    var postData = JSON.stringify(req.body);
    header.setHeader(req.session.token);
    var response = await axios.post(api.courseApprove, req.body, header.getHeader());
    return response.data;
}