var qnsAnsModel = require("../models/qnsAnsModel");
const { statusMessages } = require("../helper/constant");
const mysql = require("mysql");

exports.create = (req, res) => {
  var { course_id, user_id, comment, parent_id } = req.body;

  

  if (course_id && user_id && comment) {
    var data = {
      course_id: course_id,
      user_id: user_id,
      comment: comment,
      parent_id: parent_id?parent_id:0,
    };

    qnsAnsModel.create(data, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: "record not insert! ",
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: "record insert successfully ",
          data: [],
        });
      }
    });
  } else {
    res.status(200).json({
      status: false,
      msg: statusMessages.allFieldRequired,
      data: [],
    });
  }
};

exports.update = (req, res) => {
  var { comment } = req.body;
  var { id } = req.params;

  if (id && comment) {
    var data = { comment: comment };

    qnsAnsModel.update(data, id, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: statusMessages.notUpdate,
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: statusMessages.update,
          data: [],
        });
      }
    });
  } else {
    res.status(200).json({
      status: false,
      msg: "id and text are required",
      data: [],
    });
  }
};

exports.delete = (req, res) => {
  const { id } = req.params;

  if (id) {
    qnsAnsModel.delete(id, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: "not delete",
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: "delete successfull",
          data: [],
        });
      }
    });
  } else {
    res.status(200).json({
      status: false,
      msg: statusMessages.requiredId,
      data: [],
    });
  }
};


exports.show=(req,res)=>{

    qnsAnsModel.show(req.body,(err,result)=>{
        if(err)
        {
            res.status(200).json({
                status: false,
                msg: "record not found ",
                data: [],
              });
        }else{
            res.status(200).json({
                status: true,
                msg: "record found ",
                data: result,
              });
        }
    })
}