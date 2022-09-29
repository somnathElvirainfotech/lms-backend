const api = require('../helper/constant');
const axios = require('axios');

const Token = require('../helper/header');
const header = new Token();

exports.getAll = async (req) => {
    // console.log(api.language)

    var payload = {
        cid: req.body.cid,
        fromdate: req.body.fromdate,
        todate: req.body.todate,
        user_email: req.body.user_email,
        std_no: req.body.std_no
    }

    console.log(payload)

    header.setHeader(req.session.token);
    var response = await axios.post(api.enrollment_search, payload, header.getHeader());
    console.log(response.data);
    return response.data;
}



exports.delete = async (req) => {
    const { id } = req.params;
    header.setHeader(req.session.token);
    const response = await axios.delete(api.language + "/" + id, header.getHeader());
    return response.data;
}