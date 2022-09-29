const api = require('../helper/constant');
const axios = require('axios');

const Token = require('../helper/header');
const { head } = require('../../api/routes/api.routes');
const header = new Token();

exports.getAll = async (req) => {
    // console.log(api.language)
    header.setHeader(req.session.token);
    var response = await axios.get(api.language, header.getHeader());
    return response.data;
}

exports.getById = async (req) => {
    const { id } = req.params;
    header.setHeader(req.session.token);
    const response = await axios.get(api.language + "/" + id, header.getHeader());
    return response.data;
}

exports.create = async (req) => {
    const data = {
        name: req.body.name
    }
    header.setHeader(req.session.token);
    const response = await axios.post(api.language, data, header.getHeader());
    return response.data;
}

exports.update = async (req) => {
    const data = {
        id: req.body.id,
        name: req.body.name
    }
    header.setHeader(req.session.token);
    const response = await axios.put(api.language, data, header.getHeader());
    return response.data;
}

exports.delete = async (req) => {
    const { id } = req.params;
    header.setHeader(req.session.token);
    const response = await axios.delete(api.language + "/" + id, header.getHeader());
    return response.data;
}