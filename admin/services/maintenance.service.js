const api = require('../helper/constant');
const axios = require('axios');
const FormData = require('form-data');

const Token = require('../helper/header');
const { head } = require('../../api/routes/api.routes');
const header = new Token();

const path = require('path');

exports.getAll = async (req) => {
    header.setHeader(req.session.token);
    var response = await axios.get(api.maintenance, header.getHeader());
    return response.data;
}


exports.create = async (req) => {

    var data={
        "maintenance_text":req.body.maintenance_text,
        "status": req.body.status,
        "date": req.body.date,
        "id": req.body.id ? req.body.id : null
    }

    header.setHeader(req.session.token);
    const response = await axios.post(api.maintenance, data, header.getHeader());
    return response.data;
}