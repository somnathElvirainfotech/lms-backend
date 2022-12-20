require("dotenv").config();
const userModel = require("../models/adminModel");
const { statusMessages } = require("../helper/constant");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
var requestIp = require("request-ip");
const { use } = require("../routes/api.routes");
const path = require("path");
const { resolve } = require("path");
const conn = require("../config/dbconfig");

exports.registration = (req, res) => {
  let { email, password1, password2 } = req.body;
  let obj = {
    column: "email",
    value: email,
  };

  if (email && password1 && password2) {
    userModel.getUser(obj, async function (error, user) {
      console.log(user.length);
      if (user.length) {
        res.status(200).json({
          status: false,
          msg: "Email" + statusMessages.allReadyExits,
          data: [],
        });
      } else {
        if (password1 === password2) {
          // password hash
          const salt = await bcrypt.genSalt(12);
          const hashPassword = await bcrypt.hash(password1, salt);
          let data = {
            firstname: "admin",
            lastname: "admin",
            email: email,
            password: hashPassword,
            role: 1,
            status: 1,
          };
          userModel.create(data, function (err, result) {
            if (err) {
              res.status(200).json({
                status: false,
                msg: statusMessages.userNotCreate,
                data: [],
              });
            } else {
              res.status(200).json({
                status: true,
                msg: "Admin " + statusMessages.userCreate,
                data: [],
              });
            }
          });
        } else {
          res.status(200).json({
            status: false,
            msg: statusMessages.passwordNotMatch,
            data: [],
          });
        }
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

exports.login = (req, res) => {
  const { email, password } = req.body;
  let obj = {
    column: "email",
    value: email,
  };
  //console.log(req.body)
  if (email && password) {
    userModel.getUser(obj, async function (error, user) {
      // console.log(user)
      if (user.length) {
        const isMatch = await bcrypt.compare(password, user[0].password);
        if (email === user[0].email && isMatch) {
          if (user[0].role === 1) {
            const token = jwt.sign(
              {
                id: user[0].id,
                email: user[0].email,
              },
              process.env.jwt_secret_key,
              { expiresIn: "5d" }
            );

            const userData = {
              email: user[0].email,
              firstname: user[0].firstname,
              lastname: user[0].lastname,
              role: user[0].role,
              id: user[0].id,
            };
            var clientIp = requestIp.getClientIp(req);
            var loginData = {
              userId: user[0].id,
              clientIp: clientIp,
            };

            userModel.loginInsert(loginData, (error, data) => {
              // console.log(data)
              res.status(200).json({
                status: true,
                msg: statusMessages.login,
                data: userData,
                token: "Bearer " + token,
              });
            });
          } else {
            res.status(200).json({
              status: false,
              msg: "You are not admin user",
              data: [],
            });
          }
        } else {
          res.status(200).json({
            status: false,
            msg: statusMessages.loginFaield,
            data: [],
          });
        }
      } else {
        res.status(200).json({
          status: false,
          msg: statusMessages.loginFaield,
          data: [],
        });
      }
    });
  } else {
    res.status(200).json({ status: false, msg: statusMessages.loginCheck });
  }
};

exports.userCsv = (req, res) => {
  console.log(req.files);

  if (req.files) {
    var fileName =
      Date.now() + "_" + "file" + path.extname(req.files.user_csv_file.name);
    console.log("csvfile  ", fileName);
    var newPath = path.join(process.cwd(), "uploads/csvfolder", fileName);
    req.files.user_csv_file.mv(newPath);

    userModel.userCsvUpload(fileName, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: "users not create",
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: "users create successfull",
          data: [],
        });
      }
    });
  } else {
    res.status(200).json({
      status: false,
      msg: "file not selected",
      data: [],
    });
  }
};

exports.dashboard = async (req, res) => {
  // total creator
  var sql = `SELECT COUNT(id) AS total_creator from users WHERE role=4 AND is_active=1`;
  var total_creator = await new Promise((resolve, reject) => {
    conn.query(sql, (err, result) => {
      if (err) throw err;
      resolve(result[0].total_creator);
    });
  });

  // total user
  var sql = `SELECT COUNT(id) AS total_user from users WHERE role=5 AND is_active=1`;
  var total_user = await new Promise((resolve, reject) => {
    conn.query(sql, (err, result) => {
      if (err) throw err;
      resolve(result[0].total_user);
    });
  });

  // total supervisor
  var sql = `SELECT COUNT(id) AS total_supervisor from users WHERE role=2 AND is_active=1`;
  var total_supervisor = await new Promise((resolve, reject) => {
    conn.query(sql, (err, result) => {
      if (err) throw err;
      resolve(result[0].total_supervisor);
    });
  });

  // total course
  var sql = `SELECT COUNT(id) AS total_course from courses WHERE published_status='active' AND approved_status='active'`;
  var total_course = await new Promise((resolve, reject) => {
    conn.query(sql, (err, result) => {
      if (err) throw err;
      resolve(result[0].total_course);
    });
  });

  // total task
  var sql = `SELECT COUNT(id) AS total_task from task WHERE task_status='approve' AND delete_status  ='active'`;
  var total_task = await new Promise((resolve, reject) => {
    conn.query(sql, (err, result) => {
      if (err) throw err;
      resolve(result[0].total_task);
    });
  });

   // total enroll
   var sql = `SELECT COUNT(id) AS total_enroll from enrollments WHERE user_enroll_status='active'`;
   var total_enroll = await new Promise((resolve, reject) => {
     conn.query(sql, (err, result) => {
       if (err) throw err;
       resolve(result[0].total_enroll);
     });
   });


  res.status(200).json({
    msg:"dashboard data",
    data:{
        total_creator:total_creator,
        total_user:total_user,
        total_course:total_course,
        total_task:total_task,
        total_enroll:total_enroll,
        total_supervisor:total_supervisor
    },
    status:true
  })

};
