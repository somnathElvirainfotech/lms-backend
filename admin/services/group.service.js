const api = require('../helper/constant');
const axios = require('axios');

const Token = require('../helper/header');
const { head } = require('../../api/routes/api.routes');
const header = new Token();

exports.getAll = async (req) => {
    // console.log(api.language)
    header.setHeader(req.session.token);
    var response = await axios.get(api.group, header.getHeader());
    return response.data;
}

exports.getById = async (req) => {
    const { id } = req.params;
    header.setHeader(req.session.token);
    const response = await axios.get(api.group + "/" + id, header.getHeader());
    return response.data;
}

exports.create = async (req) => {
    const data = {
        g_name: req.body.g_name
    }
    header.setHeader(req.session.token);
    const response = await axios.post(api.group, data, header.getHeader());
    return response.data;
}

exports.update = async (req) => {
    const data = {
        id: req.body.id,
        g_name: req.body.g_name,
        g_status: req.body.g_status
    }
    header.setHeader(req.session.token);
    const response = await axios.put(api.group, data, header.getHeader());
    return response.data;
}

exports.delete = async (req) => {
    const { id } = req.params;
    header.setHeader(req.session.token);
    const response = await axios.delete(api.group + "/" + id, header.getHeader());
    return response.data;
}