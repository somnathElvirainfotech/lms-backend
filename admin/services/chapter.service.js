const api = require('../helper/constant');
const axios = require('axios');

const Token = require('../helper/header');
const { head } = require('../../api/routes/api.routes');
const header = new Token();

exports.getAll = async (req) => {
    // console.log(api.language)
    header.setHeader(req.session.token);
    var response = await axios.get(api.chapter, header.getHeader());
    return response.data;
}

exports.getById = async (req) => {
    const { id } = req.params;
    header.setHeader(req.session.token);
    const response = await axios.get(api.chapter + "/" + id, header.getHeader());
    return response.data;
}

exports.course_chapter = async (req) => {
    const { id } = req.params;
    header.setHeader(req.session.token);
    const response = await axios.get(api.course_chapter + "/" + id, header.getHeader());
    return response.data;
}


exports.create = async (req) => {
    const data = {
        chapter_name: req.body.chapter_name,
        course_id: req.body.course_id
    }
    header.setHeader(req.session.token);
    const response = await axios.post(api.chapter, data, header.getHeader());
    return response.data;
}

exports.update = async (req) => {
    const data = {
        id: req.body.id,
        chapter_name: req.body.chapter_name,
        course_id: req.body.course_id
    }
    header.setHeader(req.session.token);
    const response = await axios.put(api.chapter, data, header.getHeader());
    return response.data;
}

exports.delete = async (req) => {
    const { id } = req.params;
    header.setHeader(req.session.token);
    const response = await axios.delete(api.chapter + "/" + id, header.getHeader());
    return response.data;
}

