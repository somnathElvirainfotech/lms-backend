const api = require('../helper/constant');
const axios = require('axios');

const Token = require('../helper/header');
const { head } = require('../../api/routes/api.routes');
const header = new Token();

exports.search = async (req) => {
    // console.log(api.language)
    header.setHeader(req.session.token);
    var data = {
        group_id: "",
        created_by: "",
        course_id: "",
      };
    var response = await axios.post(api.task+'/search',data, header.getHeader()).catch((err)=>console.log(err));
    return response.data;
}

exports.download = async (req) => {
    // console.log(api.language)
    header.setHeader(req.session.token);
     var id=req.params.id;
    var response = await axios.get(api.task+'-download/'+id, header.getHeader()).catch((err)=>console.log(err));
    return response.data;
}
