const e = require("connect-flash");
const XapiService = require("../helper/Service");
const conn = require("../config/dbconfig");
const mysql = require("mysql");
const { param } = require("../routes/api.routes");
const enrollmentModel = require("../models/enrollment.model");

exports.xapiRead = async (req, res) => {
  var { course_type, enrollment_id } = req.body;

  //console.log(req.body);
  // xapi course answer and question ------------------------

  if (course_type == "xapi" && enrollment_id) {
    // var tarr = course_name.split("xapi_");
    // course_name = tarr[1];

    // var agent = user_email;
    // var activity = "";
    // var verb = "";

    // var data = {
    //   agent: '{"mbox": "mailto:' + agent + '"}',
    //   activity: activity,
    //   verb: "", //`http://adlnet.gov/expapi/verbs/${verb}`
    // };

    // // ------ xapi course total user enroll
    // //var totalCourse = ["practice1", "practice2"];

    // var xapiCourse = [];

    // var responceAll = await XapiService.getXapiStatements(data);

    // // get all xapi course id  ----------------
    // var xapiCourseIdArr = [];

    // for (var course of responceAll.data.statements) {
    //   var xapiCourseId = course.context.contextActivities.grouping[0].id;

    //   if (!xapiCourseIdArr.includes(xapiCourseId)) {
    //     xapiCourseIdArr.push(xapiCourseId);
    //   }
    // }
    // //   -----------------------------------

    // var data = {
    //   agent: '{"mbox": "mailto:' + agent + '"}',
    //   verb: "http://adlnet.gov/expapi/verbs/passed",
    // };

    // var responceViewAll = await XapiService.getXapiStatements(data);
    // var view_idArr = [];
    // for (var course of responceViewAll.data.statements) {
    //   var extensionsView_id = course.context.extensions["ispring://view_id"];

    //   if (
    //     !view_idArr.includes(extensionsView_id) &&
    //     xapiCourseIdArr[0] == course.context.contextActivities.grouping[0].id
    //   ) {
    //     view_idArr.push(extensionsView_id);
    //     break;
    //   }
    // }

    // // console.log(view_idArr);

    // //console.log(totalCourse);

    // //  console.log(data);

    // // --------------------------------------------
    // for (var item of xapiCourseIdArr) {
    //   var arr = item.split("/");

    //   if (arr.includes(course_name)) {
    //     var aa = {
    //       course_name: course_name,
    //       xapi_course_id: item,
    //     };

    //     xapiCourse.push(aa);
    //   }
    // }
    // // --------------------------------------------

    // var tempArr = [];

    // var xdata = {
    //   agent: '{"mbox": "mailto:' + agent + '"}',
    //   verb: `http://adlnet.gov/expapi/verbs/answered`,
    // };

    // var xresponce = await XapiService.getXapiStatements(xdata);

    // // ----- -----------------------------
    // for (var item of view_idArr) {
    //   var count = 0;

    //   if (xresponce.data.statements.length > 0) {
    //     for (var singleRes of xresponce.data.statements) {
    //       if (item == singleRes.context.extensions["ispring://view_id"]) {
    //         var qusAns = {
    //           result: {},
    //           questionAns: {},
    //         };

    //         if ("result" in singleRes) {
    //           qusAns.result = singleRes.result;
    //         }

    //         if ("object" in singleRes) {
    //           qusAns.questionAns = singleRes.object;
    //         }

    //         tempArr.push(qusAns);
    //       }
    //     }
    //   }
    // }

    // var tempChk = [];
    // var finalArr = [];

    // for (var i of tempArr.reverse()) {
    //   if (!tempChk.includes(i.questionAns.id)) {
    //     finalArr.push(i);
    //     tempChk.push(i.questionAns.id);
    //   }
    // }

    // // delete-----------------

    // var sql = `SELECT * FROM question WHERE enrollment_id=${mysql.escape(
    //   enrollment_id
    // )} `;
    // var qnsAll = await new Promise((resolve, reject) => {
    //   conn.query(sql, (err, result) => {
    //     if (err) throw err;
    //     resolve(result);
    //   });
    // });

    // var sql = `DELETE FROM question WHERE enrollment_id=${mysql.escape(
    //   enrollment_id
    // )} `;
    // var qnsId = await new Promise((resolve, reject) => {
    //   conn.query(sql, (err, result) => {
    //     if (err) throw err;
    //     resolve(true);
    //   });
    // });

    // for (i of qnsAll) {
    //   var sql = `DELETE FROM question_options WHERE question_id=${mysql.escape(
    //     i.id
    //   )} `;
    //   var qnsId = await new Promise((resolve, reject) => {
    //     conn.query(sql, (err, result) => {
    //       if (err) throw err;
    //       resolve(true);
    //     });
    //   });
    // }

    // // final result dataset--------------------------------------------------

    // var lastArr = [];
    // for (var item of finalArr) {
    //   // question add
    //   var temp = {
    //     question_name: item.questionAns.definition.description.und,
    //     user_answer: item.result.response,
    //     correct_answer: item.questionAns.definition.correctResponsesPattern[0],
    //     answer_status:
    //       item.result.response ===
    //       item.questionAns.definition.correctResponsesPattern[0]
    //         ? "true"
    //         : "false",
    //     enrollment_id: enrollment_id,
    //   };

    //   var sql = `INSERT INTO question set created_at=NOW(), ? `;

    //   var qnsId = await new Promise((resolve, reject) => {
    //     conn.query(sql, temp, (err, result) => {
    //       if (err) throw err;
    //       resolve(result.insertId);
    //     });
    //   });

    //   // option add --------------------------------------------
    //   var o_temp = {};
    //   if ("choices" in item.questionAns.definition) {
    //     for (var i of item.questionAns.definition.choices) {
    //       o_temp = {
    //         question_id: qnsId,
    //         option_name: i.description.und,
    //         option_id: i.id,
    //         option_type: "choices",
    //       };

    //       var sql = `INSERT INTO question_options set created_at=NOW(), ? `;

    //       await new Promise((resolve, reject) => {
    //         conn.query(sql, o_temp, (err, result) => {
    //           if (err) throw err;
    //           resolve(true);
    //         });
    //       });
    //     }
    //   } else if (
    //     "source" in item.questionAns.definition &&
    //     "target" in item.questionAns.definition
    //   ) {
    //     // source ---------
    //     for (var i of item.questionAns.definition.source) {
    //       o_temp = {
    //         question_id: qnsId,
    //         option_name: i.description.und,
    //         option_id: i.id,
    //         option_type: "source",
    //       };

    //       var sql = `INSERT INTO question_options set created_at=NOW(), ? `;

    //       await new Promise((resolve, reject) => {
    //         conn.query(sql, o_temp, (err, result) => {
    //           if (err) throw err;
    //           resolve(true);
    //         });
    //       });
    //     }

    //     // target ---------
    //     for (var i of item.questionAns.definition.target) {
    //       o_temp = {
    //         question_id: qnsId,
    //         option_name: i.description.und,
    //         option_id: i.id,
    //         option_type: "target",
    //       };

    //       var sql = `INSERT INTO question_options set created_at=NOW(), ? `;

    //       await new Promise((resolve, reject) => {
    //         conn.query(sql, o_temp, (err, result) => {
    //           if (err) throw err;
    //           resolve(true);
    //         });
    //       });
    //     }
    //   }
    // }

    //------------------------------------------------------------------------

    // local database result qnsAll

    var l_arr = [];

    var sql = `SELECT * FROM question WHERE enrollment_id=${mysql.escape(
      enrollment_id
    )} `;
    var qnsAll = await new Promise((resolve, reject) => {
      conn.query(sql, (err, result) => {
        if (err) throw err;
        resolve(result);
      });
    });

    for (var item of qnsAll) {
      // user ans name
      var qrr = `SELECT * FROM question_options WHERE question_id=${mysql.escape(
        item.id
      )} AND option_id=${mysql.escape(item.user_answer)}`;

      console.log("uans  ", qrr);

      var data = await new Promise((resolve, reject) => {
        conn.query(qrr, (err, result) => {
          if (err) throw err;

          resolve(result);
        });
      });

      // console.log("user ans name",data)

      if (data.length > 0) item.user_answer_name = data[0].option_name;

      // correct ans name
      var qrr = `SELECT * FROM question_options WHERE question_id=${mysql.escape(
        item.id
      )} AND option_id=${mysql.escape(item.correct_answer)}`;

      var data = await new Promise((resolve, reject) => {
        conn.query(qrr, (err, result) => {
          if (err) throw err;

          resolve(result);
        });
      });

      // console.log("user ans name",data)

      if (data.length > 0) item.correct_answer_name = data[0].option_name;

      var qrr = `SELECT * FROM question_options WHERE question_id=${mysql.escape(
        item.id
      )}`;

      //console.log(qrr);
      var data = await new Promise((resolve, reject) => {
        conn.query(qrr, (err, result) => {
          if (err) throw err;

          resolve(result);
        });
      });

      var ditem = {
        choices: [],
        source: [],
        target: [],
      };
      for (var i of data) {
        if (i.option_type == "choices") {
          ditem.choices.push(i);
        } else if (i.option_type == "source") {
          ditem.source.push(i);
        } else if (i.option_type == "target") {
          ditem.target.push(i);
        }
      }

      item.options = ditem;

      item.option_type = data[0].option_type;

      console.log(data[0].option_type);

      l_arr.push(item);
    }

    console.log("result  ", l_arr);

    res.status(200).json({
      status: true,
      msg: " record  found ",
      data: l_arr,
    });
  } else {
    res.status(200).json({
      status: false,
      msg: " record not found ",
      data: [],
    });
  }

  //end xapi -----------------------------------------------
};

exports.resultSave = async (req, res) => {
  var { course_type, course_name, user_email, enrollment_id } = req.body;

  //console.log(req.body);
  // xapi course answer and question ------------------------

  if (course_type == "xapi" && course_name && user_email && enrollment_id) {
    var tarr = course_name.split("xapi_");
    course_name = tarr[1] ? tarr[1] : tarr[0];

    var tempChk = [];
    var finalArr = [];

    console.log("course_name ", course_name);

    var agent = user_email;
    var activity = "";
    var verb = "";

    var sql = `SELECT * FROM question WHERE enrollment_id=${mysql.escape(
      enrollment_id
    )} `;
    var qnsAllOne = await new Promise((resolve, reject) => {
      conn.query(sql, (err, result) => {
        if (err) throw err;
        if (result.length > 0) resolve(result);
        else resolve([]);
      });
    });

    // var data = {
    //   agent: '{"mbox": "mailto:' + agent + '"}',
    //   activity: activity,
    //   verb: "", //`http://adlnet.gov/expapi/verbs/${verb}`
    // };

    // ------ xapi course total user enroll`
    //var totalCourse = ["practice1", "practice2"];

    var xapiCourse = [];

    // var responceAll = await XapiService.getXapiStatements(data);

    // get all xapi course id  ----------------
    var xapiCourseIdArr = [];

    // for (var course of responceAll.data.statements) {

    //   var xapiCourseId = course.context.contextActivities.grouping[0].id;

    //   if (!xapiCourseIdArr.includes(xapiCourseId)) {
    //     xapiCourseIdArr.push(xapiCourseId);
    //   }
    // }

    // console.log("xapiCourseIdArr ",xapiCourseIdArr);
    //  -----------------------------------

    var data = {
      agent: '{"mbox": "mailto:' + agent + '"}',
      verb: "http://adlnet.gov/expapi/verbs/passed",
    };

    var responceViewAll = await XapiService.getXapiStatements(data);
    var view_idArr = [];
    for (var course of responceViewAll.data.statements) {
      var extensionsView_id = course.context.extensions["ispring://view_id"];
      var tarr = course.object.definition.name.und.split("xapi_");
      var c_n = tarr[1] ? tarr[1] : tarr[0];
      if (!view_idArr.includes(extensionsView_id) && course_name == c_n) {
        view_idArr.push(extensionsView_id);
        break;
      }
    }

    // console.log("view_idArr ",view_idArr);

    //console.log(totalCourse);

    //  console.log(data);

    // --------------------------------------------
    // for (var item of xapiCourseIdArr) {
    //   var arr = item.split("/");

    //   if (arr.includes(course_name)) {
    //     var aa = {
    //       course_name: course_name,
    //       xapi_course_id: item,
    //     };

    //     xapiCourse.push(aa);
    //   }
    // }

    // console.log("xapiCourse ",xapiCourse);
    // --------------------------------------------

    var chkTimestam =
      qnsAllOne.length > 0
        ? qnsAllOne[0].updated_at == null
          ? qnsAllOne[0].created_at
          : qnsAllOne[0].updated_at
        : null;

    if (view_idArr.length > 0) {
      var tempArr = [];

      var xdata = {
        agent: '{"mbox": "mailto:' + agent + '"}',
        verb: `http://adlnet.gov/expapi/verbs/answered`,
      };

      var xresponce = await XapiService.getXapiStatements(xdata);

      // ----- -----------------------------
      for (var item of view_idArr) {
        var count = 0;

        if (xresponce.data.statements.length > 0) {
          for (var singleRes of xresponce.data.statements) {
            if (item == singleRes.context.extensions["ispring://view_id"]) {
              if ("score" in singleRes.result) {
                var qusAns = {
                  result: {},
                  questionAns: {},
                  timestamp: singleRes.timestamp,
                };

                if ("result" in singleRes) {
                  qusAns.result = singleRes.result;
                }

                if ("object" in singleRes) {
                  qusAns.questionAns = singleRes.object;
                }

                if (
                  !chekDupQns(
                    tempArr,
                    singleRes.object.definition.description.und
                  )
                ) {
                  // ------------- qnns chk ------------------
                  tempArr.push(qusAns);
                }
              }
            }
          }
        }
      }

      console.log("tempArr  ", tempArr.length);

      for (var i of tempArr.reverse()) {
        if (!tempChk.includes(i.questionAns.id)) {
          finalArr.push(i);
          tempChk.push(i.questionAns.id);
        }
      }
    }

    console.log("finalArr ---- ", finalArr);
    console.log("view_idArr ---- ", view_idArr);

    if (view_idArr.length > 0 && finalArr.length > 0) {
      // delete-----------------

      var sql = `SELECT * FROM question WHERE enrollment_id=${mysql.escape(
        enrollment_id
      )} `;
      var qnsAll = await new Promise((resolve, reject) => {
        conn.query(sql, (err, result) => {
          if (err) throw err;
          if (result.length > 0) resolve(result);
          else resolve([]);
        });
      });

      var chk = false;

      if (qnsAll.length > 0) {
        var qtarr = [qnsAll[0]];

        for (i of qtarr.reverse()) {
          // console.log(finalArr[0].timestamp);
          //  console.log(i.created_at);

          if (Date.parse(finalArr[0].timestamp) > Date.parse(i.created_at)) {
            //console.log("enter ",i.question_name);
            var sql = `DELETE FROM question WHERE enrollment_id=${mysql.escape(
              enrollment_id
            )} `;
            await new Promise((resolve, reject) => {
              conn.query(sql, (err, result) => {
                if (err) throw err;
                resolve(true);
              });
            });

            for (i of qnsAll) {
              var sql = `DELETE FROM question_options WHERE question_id=${mysql.escape(
                i.id
              )} `;
              await new Promise((resolve, reject) => {
                conn.query(sql, (err, result) => {
                  if (err) throw err;
                  resolve(true);
                });
              });
            }

            console.log("time del");

            chk = true;
          }
        }
      } else {
        chk = true;
      }

      console.log("ghjghjgjgjg---------------------  ", chk);

      // final result dataset--------------------------------------------------
      if (chk) {
        console.log("object");

        var lastArr = [];
        for (var item of finalArr) {
          // question add
          var temp = {
            question_name: item.questionAns.definition.description.und,
            user_answer: item.result.response,
            correct_answer:
              item.questionAns.definition.correctResponsesPattern[0],
            enrollment_id: enrollment_id,
            total_marks: item.result.score.max,
            user_marks: item.result.score.raw,
          };

          if ("choices" in item.questionAns.definition) {
            // temp.answer_status = await new Promise((resolve,reject)=>{
            //   var status=resultMatching2(item.result.response, item.questionAns.definition.correctResponsesPattern[0])==true ? "true" : "false";
            //   resolve(status);
            // })

            temp.answer_status =
              item.result.score.raw === item.result.score.max
                ? "true"
                : "false";
          } else if (
            "source" in item.questionAns.definition &&
            "target" in item.questionAns.definition
          ) {
            // temp.answer_status = resultMatching(
            //   item.result.response,
            //   item.questionAns.definition.correctResponsesPattern[0]
            // )
            //   ? "true"
            //   : "false";

            temp.answer_status =
              item.result.score.raw === item.result.score.max
                ? "true"
                : "false";
          }

          var sql = `INSERT INTO question set created_at=NOW(), ? `;

          var qnsId = await new Promise((resolve, reject) => {
            conn.query(sql, temp, (err, result) => {
              if (err) throw err;
              resolve(result.insertId);
            });
          });

          // option add --------------------------------------------
          var o_temp = {};
          if ("choices" in item.questionAns.definition) {
            for (var i of item.questionAns.definition.choices) {
              o_temp = {
                question_id: qnsId,
                option_name: i.description.und,
                option_id: i.id,
                option_type: "choices",
              };

              var sql = `INSERT INTO question_options set created_at=NOW(), ? `;

              await new Promise((resolve, reject) => {
                conn.query(sql, o_temp, (err, result) => {
                  if (err) throw err;
                  resolve(true);
                });
              });
            }
          } else if (
            "source" in item.questionAns.definition &&
            "target" in item.questionAns.definition
          ) {
            // source ---------
            for (var i of item.questionAns.definition.source) {
              o_temp = {
                question_id: qnsId,
                option_name: i.description.und,
                option_id: i.id,
                option_type: "source",
              };

              var sql = `INSERT INTO question_options set created_at=NOW(), ? `;

              await new Promise((resolve, reject) => {
                conn.query(sql, o_temp, (err, result) => {
                  if (err) throw err;
                  resolve(true);
                });
              });
            }

            // target ---------
            for (var i of item.questionAns.definition.target) {
              o_temp = {
                question_id: qnsId,
                option_name: i.description.und,
                option_id: i.id,
                option_type: "target",
              };

              var sql = `INSERT INTO question_options set created_at=NOW(), ? `;

              await new Promise((resolve, reject) => {
                conn.query(sql, o_temp, (err, result) => {
                  if (err) throw err;
                  resolve(true);
                });
              });
            }
          }
        }

        //------------------------------------------------------------------------

        res.status(200).json({
          status: true,
          msg: "result store data ",
          data: [],
        });
      } else {
        res.status(200).json({
          status: false,
          msg: "result don't store local database ",
          data: [],
        });
      }
    } else {
      res.status(200).json({
        status: false,
        msg: "result don't store local database ",
        data: [],
      });
    }
  } else {
    res.status(200).json({
      status: false,
      msg: " fill all fields ",
      data: [],
    });
  }
};






// xapi store result -----------------------------------------------------------
var resultSave2 = async (rdata) => {
  var { course_type, course_name, user_email, enrollment_id } = rdata;
  console.log("tempArr ----------");

  //console.log(req.body);
  // xapi course answer and question ------------------------

  if (course_type == "xapi" && course_name && user_email && enrollment_id) {
    var tarr = course_name.split("xapi_");
    course_name = tarr[1] ? tarr[1] : tarr[0];

    var tempChk = [];
    var finalArr = [];

    console.log("course_name ", course_name);

    var agent = user_email;
    var activity = "";
    var verb = "";

    var sql = `SELECT * FROM question WHERE enrollment_id=${mysql.escape(
      enrollment_id
    )} `;
    var qnsAllOne = await new Promise((resolve, reject) => {
      conn.query(sql, (err, result) => {
        if (err) throw err;
        if (result.length > 0) resolve(result);
        else resolve([]);
      });
    });

    var xapiCourse = [];

    // get all xapi course id  ----------------
    var xapiCourseIdArr = [];

    var data = {
      agent: '{"mbox": "mailto:' + agent + '"}',
      verb: "http://adlnet.gov/expapi/verbs/passed",
    };

    var responceViewAll = await XapiService.getXapiStatements(data);
    var view_idArr = [];
    for (var course of responceViewAll.data.statements) {
      var extensionsView_id = course.context.extensions["ispring://view_id"];
      var tarr = course.object.definition.name.und.split("xapi_");
      var c_n = tarr[1] ? tarr[1] : tarr[0];
      if (!view_idArr.includes(extensionsView_id) && course_name == c_n) {
        view_idArr.push(extensionsView_id);
        break;
      }
    }

    var chkTimestam =
      qnsAllOne.length > 0
        ? qnsAllOne[0].updated_at == null
          ? qnsAllOne[0].created_at
          : qnsAllOne[0].updated_at
        : null;

    if (view_idArr.length > 0) {
      var tempArr = [];

      var xdata = {
        agent: '{"mbox": "mailto:' + agent + '"}',
        verb: `http://adlnet.gov/expapi/verbs/answered`,
      };

      var xresponce = await XapiService.getXapiStatements(xdata);

      // ----- -----------------------------
      for (var item of view_idArr) {
        var count = 0;

        if (xresponce.data.statements.length > 0) {
          for (var singleRes of xresponce.data.statements) {
            if (item == singleRes.context.extensions["ispring://view_id"]) {
              if ("score" in singleRes.result) {
                var qusAns = {
                  result: {},
                  questionAns: {},
                  timestamp: singleRes.timestamp,
                };

                if ("result" in singleRes) {
                  qusAns.result = singleRes.result;
                }

                if ("object" in singleRes) {
                  qusAns.questionAns = singleRes.object;
                }

                if (
                  !chekDupQns(
                    tempArr,
                    singleRes.object.definition.description.und
                  )
                ) {
                  // ------------- qnns chk ------------------
                  tempArr.push(qusAns);
                }
              }
            }
          }
        }
      }

      console.log("tempArr  ", tempArr.length);

      for (var i of tempArr.reverse()) {
        if (!tempChk.includes(i.questionAns.id)) {
          finalArr.push(i);
          tempChk.push(i.questionAns.id);
        }
      }
    }

    console.log("finalArr ---- ", finalArr);
    console.log("view_idArr ---- ", view_idArr);

    if (view_idArr.length > 0 && finalArr.length > 0) {
      // delete-----------------

      var sql = `SELECT * FROM question WHERE enrollment_id=${mysql.escape(
        enrollment_id
      )} `;
      var qnsAll = await new Promise((resolve, reject) => {
        conn.query(sql, (err, result) => {
          if (err) throw err;
          if (result.length > 0) resolve(result);
          else resolve([]);
        });
      });

      var chk = false;

      if (qnsAll.length > 0) {
        var qtarr = [qnsAll[0]];

        for (i of qtarr.reverse()) {
          // console.log(finalArr[0].timestamp);
          //  console.log(i.created_at);

          if (Date.parse(finalArr[0].timestamp) > Date.parse(i.created_at)) {
            //console.log("enter ",i.question_name);
            var sql = `DELETE FROM question WHERE enrollment_id=${mysql.escape(
              enrollment_id
            )} `;
            await new Promise((resolve, reject) => {
              conn.query(sql, (err, result) => {
                if (err) throw err;
                resolve(true);
              });
            });

            for (i of qnsAll) {
              var sql = `DELETE FROM question_options WHERE question_id=${mysql.escape(
                i.id
              )} `;
              await new Promise((resolve, reject) => {
                conn.query(sql, (err, result) => {
                  if (err) throw err;
                  resolve(true);
                });
              });
            }

            console.log("time del");

            chk = true;
          }
        }
      } else {
        chk = true;
      }

      console.log("ghjghjgjgjg---------------------  ", chk);

      // final result dataset--------------------------------------------------
      if (chk) {
        console.log("object");

        var lastArr = [];
        for (var item of finalArr) {
          // question add
          var temp = {
            question_name: item.questionAns.definition.description.und,
            user_answer: item.result.response,
            correct_answer:
              item.questionAns.definition.correctResponsesPattern[0],
            enrollment_id: enrollment_id,
            total_marks: item.result.score.max,
            user_marks: item.result.score.raw,
          };

          if ("choices" in item.questionAns.definition) {
            // temp.answer_status = await new Promise((resolve,reject)=>{
            //   var status=resultMatching2(item.result.response, item.questionAns.definition.correctResponsesPattern[0])==true ? "true" : "false";
            //   resolve(status);
            // })

            temp.answer_status =
              item.result.score.raw === item.result.score.max
                ? "true"
                : "false";
          } else if (
            "source" in item.questionAns.definition &&
            "target" in item.questionAns.definition
          ) {
            // temp.answer_status = resultMatching(
            //   item.result.response,
            //   item.questionAns.definition.correctResponsesPattern[0]
            // )
            //   ? "true"
            //   : "false";

            temp.answer_status =
              item.result.score.raw === item.result.score.max
                ? "true"
                : "false";
          }

          var sql = `INSERT INTO question set created_at=NOW(), ? `;

          var qnsId = await new Promise((resolve, reject) => {
            conn.query(sql, temp, (err, result) => {
              if (err) throw err;
              resolve(result.insertId);
            });
          });

          // option add --------------------------------------------
          var o_temp = {};
          if ("choices" in item.questionAns.definition) {
            for (var i of item.questionAns.definition.choices) {
              o_temp = {
                question_id: qnsId,
                option_name: i.description.und,
                option_id: i.id,
                option_type: "choices",
              };

              var sql = `INSERT INTO question_options set created_at=NOW(), ? `;

              await new Promise((resolve, reject) => {
                conn.query(sql, o_temp, (err, result) => {
                  if (err) throw err;
                  resolve(true);
                });
              });
            }
          } else if (
            "source" in item.questionAns.definition &&
            "target" in item.questionAns.definition
          ) {
            // source ---------
            for (var i of item.questionAns.definition.source) {
              o_temp = {
                question_id: qnsId,
                option_name: i.description.und,
                option_id: i.id,
                option_type: "source",
              };

              var sql = `INSERT INTO question_options set created_at=NOW(), ? `;

              await new Promise((resolve, reject) => {
                conn.query(sql, o_temp, (err, result) => {
                  if (err) throw err;
                  resolve(true);
                });
              });
            }

            // target ---------
            for (var i of item.questionAns.definition.target) {
              o_temp = {
                question_id: qnsId,
                option_name: i.description.und,
                option_id: i.id,
                option_type: "target",
              };

              var sql = `INSERT INTO question_options set created_at=NOW(), ? `;

              await new Promise((resolve, reject) => {
                conn.query(sql, o_temp, (err, result) => {
                  if (err) throw err;
                  resolve(true);
                });
              });
            }
          }
        }

        //------------------------------------------------------------------------

        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } else {
    return false;
  }
};

// for xapi api--------
exports.storeResult = async (req, res) => {
  const { USER_EMAIL, USER_ID, USER_ROLE, XAPI_NAME } = req.body;

  if(USER_EMAIL && USER_ID && USER_ROLE && XAPI_NAME)
  {
      await xapiCourseSubmit(USER_ID, USER_ROLE, XAPI_NAME,USER_EMAIL);
      res.send("success full ");
  }else{
    res.send(" USER EMAIL, USER ID, USER ROLE, XAPI COURSE NAME REQUIRED")
  }
};


var chkDuplicate = (arr, valu) => {
  for (var i of arr) {
    if (i.viewId == valu) {
      return false;
    }
  }

  return true;
};

var chkDuplicate2 = (arr, valu) => {
  for (var i of arr) {
    var a = i.course_name.split("xapi_");
    var cn = a[1] ? a[1] : a[0];
    if (cn == valu) {
      return false;
    }
  }

  return true;
};

var chkDuplicate3 = (arr, valu) => {
  for (var i of arr) {
    if (i.groupId == valu) {
      return false;
    }
  }

  return true;
};

var getXapiData = async (totalCourse,USER_EMAIL,USER_ID) => {
  // setShowLoader(true)

  var agent = USER_EMAIL;
  var activity = "";
  var verb = "";

  var data = {
    agent: '{"mbox": "mailto:' + agent + '"}',
    activity: activity,
    verb: "", //`http://adlnet.gov/expapi/verbs/${verb}`
  };

  // ------ xapi course total user enroll
  //var totalCourse = ["practice1", "practice2"];

  var xapiCourse = [];

  // ------------- student all course setup -------------------------------
  for (var y of totalCourse) {
    var aa = {
      enrollment_id: y.enrollment_id,
      user_email: y.user_email,
      course_type: y.course_type,
      course_name: y.course_name,
      user_id: USER_ID,
      timestamp: y.timestamp,
      updateTimestamp: "",
      enrollment_status: y.enrollment_status,
      xapi_course_id: "",
      course_id: y.course_id,
      enroll_id: y.enroll_id,
      attempted: 0,
      failed: false,
      passed: false,
      total_number: 0,
      score_number: 0,
    };

    xapiCourse.push(aa);
  }

  // console.log(xapiCourse);

  // --------------------------------------------

  var tempArr = [];

  var agent = USER_EMAIL;
  var activity = "";
  var verb = "";

  var data = {
    agent: '{"mbox": "mailto:' + agent + '"}',
    verb: `http://adlnet.gov/expapi/verbs/passed`,
  };
  var responce = await XapiService.getXapiStatements(data);

  // ----- -----------------------------
  for (var item of xapiCourse) {
    var count = 0;

    if (responce.data.statements.length > 0) {
      for (var singleRes of responce.data.statements) {
        // console.log(singleRes.object.definition.name);

        console.log(
          "--",
          chkDuplicate(
            tempArr,
            singleRes.context.extensions["ispring://view_id"]
          )
        );
        console.log(
          "--",
          chkDuplicate2(tempArr, singleRes.object.definition.name.und)
        );

        if (
          chkDuplicate(
            tempArr,
            singleRes.context.extensions["ispring://view_id"]
          ) &&
          chkDuplicate2(tempArr, singleRes.object.definition.name.und) &&
          chkDuplicate3(
            tempArr,
            singleRes.context.contextActivities.grouping[0].id
          )
        ) {
          console.log(
            "object ",
            singleRes.context.extensions["ispring://view_id"]
          );

          if ("definition" in singleRes.object) {
            if ("name" in singleRes.object.definition) {
              if (
                item.course_name == singleRes.object.definition.name.und &&
                Date.parse(singleRes.timestamp) > Date.parse(item.timestamp)
              ) {
                //  console.log("one");

                //   console.log("sssss");

                if ("result" in singleRes) {
                  if (
                    "completion" in singleRes.result &&
                    singleRes.result.completion == true
                  ) {
                    if ("success" in singleRes.result) {
                      // console.log("item  ", singleRes.result.success);

                      if (singleRes.result.success) {
                        item.passed = true;
                        item.failed = false;
                        item.total_number = singleRes.result.score.max;
                        item.score_number = singleRes.result.score.raw;
                        item.updateTimestamp = singleRes.timestamp;
                        item.enrollment_status = "completed";
                        item.viewId =
                          singleRes.context.extensions["ispring://view_id"];
                        item.groupId =
                          singleRes.context.contextActivities.grouping[0].id;
                      }

                      // else {
                      //   if (item.passed == false) {
                      //     item.failed = true;
                      //     item.passed = false;
                      //     item.total_number = singleRes.result.score.max;
                      //     item.score_number = singleRes.result.score.raw;
                      //     item.updateTimestamp=singleRes.timestamp
                      //   }
                      // }

                      tempArr.push(item);
                    }
                  }
                } else {
                  item.attempted = count + 1;
                }
              }
            }
          }
        }
      }
    }
  }

  // --------------- failed

  // if (xapiCourse[0].passed == false && xapiCourse[0].failed == false) {

  //     var data = {
  //         agent: '{"mbox": "mailto:' + agent + '"}',
  //         verb: `http://adlnet.gov/expapi/verbs/failed`,
  //         ascending: false,
  //     };
  //     var responce = await XapiService.getXapiStatements(data);

  //     for (var item of xapiCourse) {
  //         var count = 0;

  //         if (responce.data.statements.length > 0) {
  //             for (var singleRes of responce.data.statements) {
  //                 // console.log(singleRes.object.definition.name);

  //                 console.log("--", chkDuplicate(tempArr, singleRes.context.extensions["ispring://view_id"]));
  //                 console.log("--", chkDuplicate2(tempArr, singleRes.object.definition.name.und));

  //                 if (chkDuplicate(tempArr, singleRes.context.extensions["ispring://view_id"]) && chkDuplicate2(tempArr, singleRes.object.definition.name.und) &&
  //                     chkDuplicate3(tempArr, singleRes.context.contextActivities.grouping[0].id)) {

  //                     console.log("object ", singleRes.context.extensions["ispring://view_id"]);

  //                     if ("definition" in singleRes.object) {
  //                         if ("name" in singleRes.object.definition) {
  //                             if (
  //                                 item.course_name == singleRes.object.definition.name.und &&
  //                                 Date.parse(singleRes.timestamp) > Date.parse(item.timestamp)
  //                             ) {

  //                                 //  console.log("one");

  //                                 //   console.log("sssss");

  //                                 if ("result" in singleRes) {
  //                                     if (
  //                                         "completion" in singleRes.result &&
  //                                         singleRes.result.completion == true
  //                                     ) {
  //                                         if ("success" in singleRes.result) {
  //                                             // console.log("item  ", singleRes.result.success);

  //                                             if (singleRes.result.success==false) {
  //                                                 item.passed = false;
  //                                                 item.failed = true;
  //                                                 item.total_number = singleRes.result.score.max;
  //                                                 item.score_number = singleRes.result.score.raw;
  //                                                 item.updateTimestamp = singleRes.timestamp
  //                                                 item.enrollment_status = "failed"
  //                                                 item.viewId = singleRes.context.extensions["ispring://view_id"]
  //                                                 item.groupId = singleRes.context.contextActivities.grouping[0].id;
  //                                             }

  //                                             // else {
  //                                             //   if (item.passed == false) {
  //                                             //     item.failed = true;
  //                                             //     item.passed = false;
  //                                             //     item.total_number = singleRes.result.score.max;
  //                                             //     item.score_number = singleRes.result.score.raw;
  //                                             //     item.updateTimestamp=singleRes.timestamp
  //                                             //   }
  //                                             // }

  //                                             tempArr.push(item);
  //                                         }
  //                                     }
  //                                 } else {
  //                                     item.attempted = count + 1;
  //                                 }
  //                             }
  //                         }
  //                     }

  //                 }

  //             }
  //         }
  //     }

  // }

  // ----------------------------

  // console.log("xapi----data", xapiCourse);

  if (xapiCourse.length > 0) {
    console.log("xapi......-data",xapiCourse);

    // enrollment status updated  ------------------
   // await EnrollmentService.enrollmentStatusUpdate(xapiCourse);

    await new Promise((resolve, reject) => {
      enrollmentModel.statusUpdate(xapiCourse, (err, result) => {
        if (err) {
          resolve(false);
        } else {
          resolve(true);
        }
      });
    });

    // result save----------

    for (var i of xapiCourse) {
      console.log("x__course ", i.course_name);
      if (i.passed && Date.parse(i.updateTimestamp) > Date.parse(i.timestamp)) {
        if (i.enrollment_status == "completed") {
          console.log("sub one");
         await resultSave2({
          enrollment_id: i.enrollment_id,
          course_name: i.course_name,
          course_type: i.course_type,
          user_email: i.user_email,
        });
        }
      } 
    }
  }
};

var xapiCourseSubmit = async (user_id, user_role, xapi_course_name,USER_EMAIL) => {
  // -----------------------------------------------

  //alert(xapi_course_name)

  if (user_role == 5) {
    let data = {
      user_id: user_id,
      course_id: "",
    };
    var xresponce = await new Promise((resolve, reject) => {
      enrollmentModel.showBYCourseOrUser(data, (err, result) => {
        if (err) {
          resolve([]);
        } else {
          resolve(result);
        }
      });
    });

    var xdata = [];
    for (var i of xresponce) {
      if (
        i.course_details[0].course_type == "xapi" &&
        xapi_course_name === i.course_details[0].xapi_file_name
      ) {
        var temp = {
          course_id: i.course_details[0].id,
          enroll_id: i.enroll_id,
          course_name: i.course_details[0].xapi_file_name,
          timestamp:
            i.course_details[0].updated_at == null
              ? i.course_details[0].created_at
              : i.course_details[0].updated_at,

          enrollment_id: i.enroll_id,
          course_type: i.course_details[0].course_type,
          user_email: i.user_details[0].email,
          enrollment_status: i.enrollment_status,
        };

        xdata.push(temp);
      }
    }

    //console.log("course data---",xdata);

    // xapi
    var status = await getXapiData(xdata,USER_EMAIL,user_id);

    if (status) return true;
    else return false;
  } else {
    return false;
  }

  // ------------------------------------------------
};

//  -----------------------

function resultMatching(payload, payload2) {
  var arr = payload.split("[,]");
  var arr1 = payload2.split("[,]");

  console.log("arr-------------- ", arr);
  console.log("arr1 ------------------", arr1);

  for (var i of arr) {
    if (!arr1.includes(i)) {
      return false;
    }
  }

  return true;
}

function resultMatching2(payload, payload2) {
  var final = payload.includes("[,]");

  if (final) {
    var arr = payload.split("[,]");
    // var tarr = payload2.split("[,]");
    var arr1 = payload2.split("[,]");

    for (var i of arr) {
      if (!arr1.includes(i)) {
        return false;
      }
    }

    return true;
  } else {
    if (payload == payload2) return true;
    else return false;
  }
}

function chekDupQns(arr, qns) {
  for (var item of arr) {
    if (item.questionAns.definition.description.und == qns) return true;
  }
  return false;
}
