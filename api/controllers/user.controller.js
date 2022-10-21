require("dotenv").config();
const userModel = require("../models/adminModel");
const { statusMessages } = require("../helper/constant");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
var requestIp = require("request-ip");
const e = require("connect-flash");
var AdmZip = require("adm-zip");
var mail = require("../config/mailconfig");

const path = require("path");

const multer = require("multer");
const upload = multer({ dest: path.join(__dirname + "uploads/") });
exports.uploadImg = upload.single("photo");

exports.registration = (req, res) => {
  const {
    firstname,
    lastname,
    email,
    password1,
    password2,
    date,
    user_hr_no,
    qualification_id,
    status,
    group_id,
    role,
  } = req.body;
  console.log(req.body);
  if (
    firstname &&
    lastname &&
    email &&
    password1 &&
    password2 &&
    status &&
    role
  ) {
    let data = {
      column: "email",
      value: email,
    };
    userModel.getUser(data, async (error, user) => {
      if (user.length) {
        res.status(200).json({
          status: false,
          msg: "Email" + statusMessages.allReadyExits,
          data: [],
        });
      } else {
        if (password1 === password2) {
          const salt = await bcrypt.genSalt(12);
          const hashPassword = await bcrypt.hash(password1, salt);
          var group_arr = req.body.group_id ? req.body.group_id.split(",") : [];
          let userData = {
            firstname: firstname,
            lastname: lastname,
            email: email,
            password: hashPassword,
            role: role ? role : null,
            status: status,
            group_id: group_arr,
            qualification_id: qualification_id ? qualification_id : null,
            date: date,
            user_hr_no: user_hr_no,
            organization_unit:
              req.body.organization_unit != "undefined"
                ? req.body.organization_unit
                : null,
            login_type: req.body.login_type,
          };

          if(req.body.language_id) userData.language_id=req.body.language_id;

          console.log("dsdsddsdsdsd", userData);
          userModel.create(userData, (err, result) => {
            if (err) {
              res.status(200).json({
                status: false,
                msg: statusMessages.userNotCreate,
                data: [],
              });
            } else {
              res.status(200).json({
                status: true,
                msg: statusMessages.userCreate,
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
      msg: statusMessages.registrationCheck,
      data: [],
    });
  }
};

exports.login = (req, res) => {
  const { email, password } = req.body;

  if ((email, password)) {
    let data = {
      column: "email",
      value: email,
    };
    userModel.getUser(data, async (error, user) => {
      if (user.length) {
        const isMatch = await bcrypt.compare(password, user[0].password);

        if (email === user[0].email && isMatch) {
          console.log(user[0].is_active);
          if (user[0].is_active) {
            if (
              user[0].role === 5 ||
              user[0].role === 4 ||
              user[0].role === 2 ||
              user[0].role === 3 
            ) {
              const token = jwt.sign(
                {
                  id: user[0].id,
                  email: user[0].email,
                },
                process.env.jwt_secret_key,
                { expiresIn: "5d" }
              );

              if (user[0].role == 5) {
              }
              console.log(user[0]);

              const userData = {
                id: user[0].id,
                username: `${user[0].firstname} ${user[0].lastname}`,
                firstname: user[0].firstname,
                lastname: user[0].lastname,
                email: user[0].email,
                status: user[0].is_active,
                role: user[0].role,
                group_id: user[0].group_id,
                group_details: user[0].group_details,
                created_at: user[0].created_at,
                updated_at: user[0].updated_at,
                login_type: user[0].login_type,
                language_id:user[0].language_id
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
                msg: statusMessages.thisUserNotLogIn,
                data: [],
              });
            }
          } else {
            res.status(200).json({
              status: false,
              msg: statusMessages.userNoActive,
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
    res.status(200).json({
      status: false,
      msg: statusMessages.registrationCheck,
      data: [],
    });
  }
};

exports.creatorLogin = (req, res) => {
  const { email, password } = req.body;

  res.cookie("cookieName", randomNumber, { maxAge: 900 });

  if ((email, password)) {
    let data = {
      column: "email",
      value: email,
    };
    userModel.getUser(data, async (error, user) => {
      if (user.length) {
        const isMatch = await bcrypt.compare(password, user[0].password);

        if (email === user[0].email && isMatch) {
          if (user[0].is_active) {
            if (user[0].role === 4) {
              const token = jwt.sign(
                {
                  id: user[0].id,
                  email: user[0].email,
                },
                process.env.jwt_secret_key,
                { expiresIn: "5d" }
              );

              const userData = {
                id: user[0].id,
                username: `${user[0].firstname} ${user[0].lastname}`,
                email: user[0].email,
                status: user[0].is_active,
                role: user[0].role,
                created_at: user[0].created_at,
                updated_at: user[0].updated_at,
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
                msg:
                  statusMessages.thisUserNotLogIn + " only creator login here",
                data: [],
              });
            }
          } else {
            res.status(200).json({
              status: false,
              msg: statusMessages.userNoActive,
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
    res.status(200).json({
      status: false,
      msg: statusMessages.registrationCheck,
      data: [],
    });
  }
};

exports.getALlUser = (req, res) => {
  userModel.getAllUser(null, (err, result) => {
    if (err) {
      res.status(200).json({
        status: false,
        msg: statusMessages.dataNotFound,
        data: [],
      });
    } else {
      res.status(200).json({
        status: true,
        msg: statusMessages.dataFound,
        data: result,
      });
    }
  });
};

// by user id
exports.getUser = (req, res) => {
  var { id } = req.params;

  if (id) {
    userModel.getUserProfile2(id, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: statusMessages.dataNotFound,
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: statusMessages.dataFound,
          data: [result],
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

// get by email
exports.getUserByEmail = (req, res) => {
  const { email,l_type } = req.body;

  if (email) {
    userModel.getUserProfile(email, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: "Invalid user",
          data: [],
        });
      } else {
        const token = jwt.sign(
          {
            id: result.id,
            email: result.email,
          },
          process.env.jwt_secret_key,
          { expiresIn: "5d" }
        );

        console.log("log type",result);
        var clientIp = requestIp.getClientIp(req);
        var loginData = {
          userId: result.id,
          clientIp: clientIp,
        };

        if(result.login_type==l_type)
        {
          userModel.loginInsert(loginData, (error, data) => {
            // console.log(data)
  
            res.status(200).json({
              status: true,
              msg: statusMessages.dataFound,
              data: [
                {
                  firstname: result.firstname,
                  lastname: result.lastname,
                  email: result.email,
                  login_type: result.login_type,
                  username: result.firstname + " " + result.lastname,
                  id: result.id,
                  status: result.is_active,
                  role: result.role,
                  group_id: result.group_id,
                  group_details: result.group_details,
                  created_at: result.created_at,
                  updated_at: result.updated_at,
                  language_id:result.language_id
                },
              ],
    
              token: "Bearer " + token,
            });
  
  
          });
        }else{

          res.status(200).json({
            status: true,
            msg: statusMessages.dataFound,
            data: [
              {
                firstname: result.firstname,
                lastname: result.lastname,
                email: result.email,
                login_type: result.login_type,
                username: result.firstname + " " + result.lastname,
                id: result.id,
                status: result.is_active,
                role: result.role,
                group_id: result.group_id,
                group_details: result.group_details,
                created_at: result.created_at,
                updated_at: result.updated_at,
                language_id:result.language_id
              },
            ],
  
            token: "Bearer " + token,
          });

        }
        

       
      }
    });
  } else {
    res.status(200).json({
      status: false,
      msg: "email is required! ",
      data: [],
    });
  }
};

exports.statusActiveInactive = (req, res) => {
  if (req.body.email) {
    var data = {
      email: req.body.email,
      status: req.body.status ? 1 : 0,
    };
    console.log(data);
    userModel.statusActiveInactive(data, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: statusMessages.error,
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: statusMessages.statusUpdate,
          data: [],
        });
      }
    });
  } else {
    res.status(200).json({
      status: false,
      msg: statusMessages.registrationCheck,
      data: [],
    });
  }
};

// by email
exports.getUserProfile = (req, res) => {
  const { email } = req.body;

  if (email) {
    userModel.getUserProfile(email, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: statusMessages.dataNotFound,
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: statusMessages.dataFound,
          data: result,
        });
      }
    });
  } else {
    res.status(200).json({
      status: false,
      msg: "email are required",
      data: [],
    });
  }
};

// by user email
exports.updateUser = (req, res) => {
  const { email } = req.body;

  // const data = {
  //     username: req.body.username,
  //     date: req.body.date?req.body.date:null,
  //     social_link_1: req.body.social_link_1,
  //     social_link_2: req.body.social_link_2
  // };

  // console.log(req.body)

  if (email) {
    console.log("uuuuuuu   ",req.body)
    const {firstname,lastname,social_link_1,social_link_2,details,language_id,qualification_id}=req.body;

    var data={};
    if(firstname) data.firstname=firstname;
    if(lastname) data.lastname=lastname;
    if(social_link_1) data.social_link_1=social_link_1;
    if(social_link_2) data.social_link_2=social_link_2;
    if(details) data.details=details;
    if(language_id) data.language_id=language_id;
    if(qualification_id) data.qualification_id=qualification_id;
    

    userModel.updateUser(data, email, (err, result) => {
      if (err) {
        console.log(result);
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
      msg: "email are required",
      data: [],
    });
  }
};

//by user id
exports.updateUserById = (req, res) => {
  const { id } = req.body;
  var group_arr = req.body.group_id ? req.body.group_id.split(",") : [];
  var data = {
    firstname: req.body.firstname,
    lastname: req.body.lastname,
    role: req.body.role,
    qualification_id: req.body.qualification_id,
    language_id: req.body.language_id,
    social_link_1: req.body.social_link_1,
    social_link_2: req.body.social_link_2,
    details: req.body.details,
    date: req.body.date ? req.body.date : null,
    is_active: req.body.status,
    user_hr_no: req.body.user_hr_no,
    organization_unit: req.body.organization_unit,
    login_type:req.body.login_type
  };

  console.log("upppppppppppp", data);

  if (id) {
    userModel.updateUserById(data, id, group_arr, (err, result) => {
      if (err) {
        console.log(result);
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
      msg: "id are required",
      data: [],
    });
  }
};

exports.changePassord = (req, res) => {
  const { email, cpassword, password1, password2 } = req.body;

  if (email && password1 && password2 && cpassword) {
    if (password1 === password2) {
      let data = {
        column: "email",
        value: email,
      };
      userModel.getUser(data, async (error, user) => {
        if (user.length) {
          const isMatch = await bcrypt.compare(cpassword, user[0].password);

          if (isMatch) {
            if (cpassword === password1) {
              res.status(200).json({
                status: false,
                msg: "Password are same to be previous password",
                data: [],
              });
            } else {
              const salt = await bcrypt.genSalt(12);
              const hashPassword = await bcrypt.hash(password1, salt);
              let userData = {
                password: hashPassword,
              };
              userModel.passwordChange(userData, email, (err, result) => {
                if (err) {
                  res.status(200).json({
                    status: false,
                    msg: "Password not change",
                    data: [],
                  });
                } else {
                  res.status(200).json({
                    status: true,
                    msg: "Password change successfull",
                    data: [],
                  });
                }
              });
            }

            // console.log(data)
          } else {
            res.status(200).json({
              status: false,
              msg: "Previous password are not match",
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
      res.status(200).json({
        status: false,
        msg: statusMessages.passwordNotMatch,
        data: [],
      });
    }
  } else {
    res.status(200).json({
      status: false,
      msg: statusMessages.registrationCheck,
      data: [],
    });
  }
};

exports.onlyChangePassword = (req, res) => {
  const { email, password1, password2 } = req.body;

  if (email && password1 && password2) {
    if (password1 === password2) {
      let data = {
        column: "email",
        value: email,
      };
      userModel.getUser(data, async (error, user) => {
        if (user.length) {
          const salt = await bcrypt.genSalt(12);
          const hashPassword = await bcrypt.hash(password1, salt);
          let userData = {
            password: hashPassword,
          };
          userModel.passwordChange(userData, email, (err, result) => {
            if (err) {
              res.status(200).json({
                status: false,
                msg: "Password not change",
                data: [],
              });
            } else {
              res.status(200).json({
                status: true,
                msg: "Password change successfull",
                data: [],
              });
            }
          });
        } else {
          res.status(200).json({
            status: false,
            msg: "user not find",
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
  } else {
    res.status(200).json({
      status: false,
      msg: statusMessages.registrationCheck,
      data: [],
    });
  }
};

exports.imageUpload = (req, res) => {
  // console.log(req.files)

  var fileName = Date.now() + "_" + req.files.image.name;
  var newPath = path.join(process.cwd(), "uploads/images", fileName);
  req.files.image.mv(newPath);

  const { email } = req.body;

  // console.log(email)
  const data = {
    image: fileName,
  };
  if (email) {
    userModel.updateUser(data, email, (err, result) => {
      if (err) {
        console.log(result);
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
      msg: "email are required",
      data: [],
    });
  }
};

exports.countCourseCertificate = (req, res) => {
  const { id } = req.params;

  if (id) {
    userModel.countCourseCertificate(id, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: statusMessages.dataNotFound,
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: statusMessages.dataFound,
          data: {
            enroll_course_count: result[0].enroll_count,
            close_course_count: result[0].complete_course_count,
            certificate_count: 0,
          },
        });
      }
    });
  }
};

exports.getUserByRoleId = (req, res) => {
  const { id } = req.params;

  if (id) {
    userModel.getUserByRoleId(id, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: statusMessages.dataNotFound,
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: statusMessages.dataFound,
          data: result,
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

// email,name,hr number
exports.userSearch = (req, res) => {
  userModel.userSearch(req.body, (err, result) => {
    if (err) {
      res.status(200).json({
        status: false,
        msg: statusMessages.dataNotFound,
        data: [],
      });
    } else {
      res.status(200).json({
        status: true,
        msg: statusMessages.dataFound,
        data: result,
      });
    }
  });
};

exports.generatePassword = (req, res) => {
  const { email, password } = req.body;
  if (email && password) {
    let data = {
      column: "email",
      value: email,
    };
    userModel.getUser(data, async (error, user) => {
      if (user.length) {
        const salt = await bcrypt.genSalt(12);
        const hashPassword = await bcrypt.hash(password, salt);
        let userData = {
          password: hashPassword,
        };
        userModel.passwordChange(userData, email, (err, result) => {
          if (err) {
            res.status(200).json({
              status: false,
              msg: "Password generate but not save db",
              data: [],
            });
          } else {
            // mail send ------------------------------------------------------

            var mailOptions = {
              from: "noreply@elvirainfotech.org",
              to: email,
              subject: "RealTimeVillage App Activation Link",
              html: `<table>
                                <tr><td>Email: </td><td>${email}</td></tr>
                                <tr><td>Password: </td><td>${password}</td></tr>
                            </table>`,
            };

            mail.sendMail(mailOptions, function (error, info) {
              if (error) {
                console.log(error);
              } else {
                console.log("Email sent: " + info.response);

                res.status(200).json({
                  status: true,
                  msg: info.response,
                  data: [],
                });
              }
            });

            // ----------------------------------------------------------------------
          }
        });
      } else {
        res.status(200).json({
          status: false,
          msg: "user not find",
          data: [],
        });
      }
    });
  } else {
    res.status(200).json({
      status: false,
      msg: statusMessages.registrationCheck,
      data: [],
    });
  }
};

exports.forgetPassword = (req, res) => {
  const { email } = req.body;
  const password = passwordGenerator(12);
  if (email) {
    let data = {
      column: "email",
      value: email,
    };

    userModel.getUser(data, async (error, user) => {
      if (user.length > 0) {
        const salt = await bcrypt.genSalt(12);
        const hashPassword = await bcrypt.hash(password, salt);
        let userData = {
          password: hashPassword,
        };
        userModel.passwordChange(userData, email, (err, result) => {
          if (err) {
            res.status(200).json({
              status: false,
              msg: "Password generate but not save db",
              data: [],
            });
          } else {
            // mail send ------------------------------------------------------

            var mailOptions = {
              from: "noreply@elvirainfotech.org",
              to: email,
              subject: "RealTimeVillage App Activation Link",
              html: `<table>
                                    <tr><td>Email: </td><td>${email}</td></tr>
                                    <tr><td>Password: </td><td>${password}</td></tr>
                                </table>`,
            };

            mail.sendMail(mailOptions, function (error, info) {
              if (error) {
                console.log(error);
              } else {
                console.log("Email sent: " + info.response);

                res.status(200).json({
                  status: true,
                  msg: "Check your email",
                  data: [],
                });
              }
            });

            // ----------------------------------------------------------------------
          }
        });
      } else {
        res.status(200).json({
          status: false,
          msg: "Not a valid email ",
          data: [],
        });
      }
    });
  } else {
    res.status(200).json({
      status: false,
      msg: "Please provide email",
      data: [],
    });
  }
};

function passwordGenerator(length) {
  var result = "";
  var characters =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()<>,.?/[]{}-=_+|/0123456789";
  var charactersLength = characters.length;
  for (var i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}
