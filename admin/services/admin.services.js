const api = require('../helper/constant');
const axios = require('axios');

const Token = require('../helper/header');
const header = new Token();
const path = require('path');


exports.login = async (data) => {
    const postData = JSON.stringify(data);
    const response = await axios.post(api.admin_api_url + "/login", postData, header.getHeader())
        .then(res => res.data)
        .catch(err => console.log(err))
    return response;
}

exports.register = async (data) => {
    const postData = JSON.stringify(data);

    const response = await axios.post(api.admin_api_url + "/registration", postData, header.getHeader())
        .then(res => res.data)
        .catch(err => console.log(err))
    return response;
}

exports.userCsvUpload = async (req) => {
    if (req.files) {
        var fileName = Date.now() + '_' + req.files.user_csv_file.name;
        var newPath = path.join(process.cwd(), 'csvfolder/userCsv', fileName)
        req.files.user_csv_file.mv(newPath);
        header.setHeader(req.session.token)
        var response = await axios.post(api.admin_api_url + '/usercsv', {
            csvFile:fileName
        }, header.getHeader());
        return response.data;
    }
}

