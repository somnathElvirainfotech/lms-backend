const e = require("connect-flash");
const XapiService = require("../helper/Service");
const conn = require("../config/dbconfig");
const mysql = require("mysql");

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

      console.log("uans  ",qrr);

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
    course_name = tarr[1];

    var agent = user_email;
    var activity = "";
    var verb = "";

    var data = {
      agent: '{"mbox": "mailto:' + agent + '"}',
      activity: activity,
      verb: "", //`http://adlnet.gov/expapi/verbs/${verb}`
    };

    // ------ xapi course total user enroll`
    //var totalCourse = ["practice1", "practice2"];

    var xapiCourse = [];

    var responceAll = await XapiService.getXapiStatements(data);

    // get all xapi course id  ----------------
    var xapiCourseIdArr = [];

    for (var course of responceAll.data.statements) {
      var xapiCourseId = course.context.contextActivities.grouping[0].id;

      if (!xapiCourseIdArr.includes(xapiCourseId)) {
        xapiCourseIdArr.push(xapiCourseId);
      }
    }
    //  -----------------------------------

    var data = {
      agent: '{"mbox": "mailto:' + agent + '"}',
      verb: "http://adlnet.gov/expapi/verbs/passed",
    };

    var responceViewAll = await XapiService.getXapiStatements(data);
    var view_idArr = [];
    for (var course of responceViewAll.data.statements) {
      var extensionsView_id = course.context.extensions["ispring://view_id"];

      if (
        !view_idArr.includes(extensionsView_id) &&
        xapiCourseIdArr[0] == course.context.contextActivities.grouping[0].id
      ) {
        view_idArr.push(extensionsView_id);
        break;
      }
    }

    // console.log(view_idArr);

    //console.log(totalCourse);

    //  console.log(data);

    // --------------------------------------------
    for (var item of xapiCourseIdArr) {
      var arr = item.split("/");

      if (arr.includes(course_name)) {
        var aa = {
          course_name: course_name,
          xapi_course_id: item,
        };

        xapiCourse.push(aa);
      }
    }
    // --------------------------------------------

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
            var qusAns = {
              result: {},
              questionAns: {},
            };

            if ("result" in singleRes) {
              qusAns.result = singleRes.result;
            }

            if ("object" in singleRes) {
              qusAns.questionAns = singleRes.object;
            }

            tempArr.push(qusAns);
          }
        }
      }
    }

    var tempChk = [];
    var finalArr = [];

    

    for (var i of tempArr.reverse()) {
      if (!tempChk.includes(i.questionAns.id)) {
        finalArr.push(i);
        tempChk.push(i.questionAns.id);
      }
    }

    if(responceViewAll.data.statements.length>0 && xresponce.data.statements.length>0)
    {

    
    // delete-----------------

    var sql = `SELECT * FROM question WHERE enrollment_id=${mysql.escape(
      enrollment_id
    )} `;
    var qnsAll = await new Promise((resolve, reject) => {
      conn.query(sql, (err, result) => {
        if (err) throw err;
        resolve(result);
      });
    });

    var sql = `DELETE FROM question WHERE enrollment_id=${mysql.escape(
      enrollment_id
    )} `;
    var qnsId = await new Promise((resolve, reject) => {
      conn.query(sql, (err, result) => {
        if (err) throw err;
        resolve(true);
      });
    });

    for (i of qnsAll) {
      var sql = `DELETE FROM question_options WHERE question_id=${mysql.escape(
        i.id
      )} `;
      var qnsId = await new Promise((resolve, reject) => {
        conn.query(sql, (err, result) => {
          if (err) throw err;
          resolve(true);
        });
      });
    }

    // final result dataset--------------------------------------------------

    var lastArr = [];
    for (var item of finalArr) {
      // question add
      var temp = {
        question_name: item.questionAns.definition.description.und,
        user_answer: item.result.response,
        correct_answer: item.questionAns.definition.correctResponsesPattern[0],
        enrollment_id: enrollment_id,
      };

      if ("choices" in item.questionAns.definition)
      {
        temp.answer_status = item.result.response == item.questionAns.definition.correctResponsesPattern[0] ? "true" : "false";
      }else if( "source" in item.questionAns.definition &&
      "target" in item.questionAns.definition)
      {
        temp.answer_status = resultMatching(
          item.result.response,
          item.questionAns.definition.correctResponsesPattern[0]
        )
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

  }
  else{
    res.status(200).json({
      status: true,
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

function resultMatching(payload, payload2) {
  var arr = payload.split("[,]");
  var arr1 = payload2.split("[,]");

  for (var i of arr) {
    if (!arr1.includes(i)) {
      return false;
    }
  }

  return true;
}
