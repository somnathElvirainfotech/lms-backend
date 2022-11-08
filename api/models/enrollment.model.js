const mysql = require("mysql");
const conn = require("../config/dbconfig");
const courseModel = require("./courses.model");
const assigmentModel = require("./assignment.model");
const userModel = require("./adminModel");
const e = require("connect-flash");
require("dotenv").config();
const userTaskModel = require("./userTask.model");
const XapiService = require("../helper/Service");

class Enrollment {
  async create(data, callback) {
    var sql1 = `SELECT * FROM enrollments WHERE user_id=${mysql.escape(
      data.user_id
    )} AND course_id=${mysql.escape(data.course_id)}`;
    console.log(sql1);
    var chk = await new Promise(function (resolve, reject) {
      conn.query(sql1, (err, result) => {
        if (err) throw err;

        if (result.length > 0) {
          resolve(true);
        } else {
          resolve(false);
        }
      });
    });

    if (chk) {
      callback(true, null);
    } else {
      var sql = `INSERT INTO enrollments(user_id, course_id,enrollment_status,date_at,created_at) VALUES (
                ${mysql.escape(data.user_id)},
                ${mysql.escape(data.course_id)},
                "pending",
                "${new Date().toISOString().slice(0, 10)}",
                NOW())`;
      console.log(sql);
      conn.query(sql, (err, result) => {
        if (err) {
          callback(true, err);
        } else {
          callback(false, result);
        }
      });
    }
  }

  update(data, id, callback) {
    var sql = `UPDATE enrollments SET updated_at=NOW(), ? WHERE id=?`;

    conn.query(sql, [data, id], (err, result) => {
      if (err) {
        callback(true, err);
      } else {
        callback(false, result);
      }
    });
  }

  async statusUpdate(data, callback) {
    // const { id, course_progress, enrollment_status }
    // console.log(data);
    for (var item of data) {
      if (item.passed) {
        await new Promise((resolve, reject) => {
          var sql = `UPDATE enrollments SET updated_at=NOW(),course_progress=${mysql.escape(
            100
          )},enrollment_status='completed',total_number=${mysql.escape(
            item.total_number
          )},score_number=${mysql.escape(
            item.score_number
          )} WHERE id=${mysql.escape(item.enroll_id)}`;
          conn.query(sql, (err, result) => {
            if (err) throw err;
            resolve("true");
          });
        });

        var taskID = await new Promise((resolve, reject) => {
          var sql = `SELECT task.id FROM task LEFT JOIN user_task ON user_task.task_id=task.id WHERE task.course_id=${mysql.escape(
            item.course_id
          )} and user_task.user_id=${mysql.escape(item.user_id)}`;
          conn.query(sql, (err, result) => {
            if (err) throw err;

            if (result.length > 0) resolve(result[0].id);
            else resolve(null);
          });
        });

        if (taskID != null) {
          await new Promise((resolve, reject) => {
            var sql = `UPDATE user_task SET updated_at=NOW(),user_task_status='passed' WHERE task_id=${mysql.escape(
              taskID
            )} AND user_id=${mysql.escape(item.user_id)}`;
            conn.query(sql, (err, result) => {
              if (err) throw err;
              resolve("true");
            });
          });
        }
      } else {
        await new Promise((resolve, reject) => {
          var sql = `UPDATE enrollments SET updated_at=NOW(),course_progress=${mysql.escape(
            0
          )},enrollment_status='onprogress',total_number=${mysql.escape(
            item.total_number
          )},score_number=${mysql.escape(
            item.score_number
          )} WHERE id=${mysql.escape(item.enroll_id)}`;
          conn.query(sql, (err, result) => {
            if (err) throw err;
            resolve("true");
          });
        });

        var taskID = await new Promise((resolve, reject) => {
          var sql = `SELECT task.id FROM task LEFT JOIN user_task ON user_task.task_id=task.id WHERE task.course_id=${mysql.escape(
            item.course_id
          )} and user_task.user_id=${mysql.escape(item.user_id)}`;
          conn.query(sql, (err, result) => {
            if (err) throw err;

            if (result.length > 0) resolve(result[0].id);
            else resolve(null);
          });
        });

        if (taskID != null) {
          if (item.failed) {
            await new Promise((resolve, reject) => {
              var sql = `UPDATE user_task SET updated_at=NOW(),user_task_status='failed' WHERE task_id=${mysql.escape(
                taskID
              )} AND user_id=${mysql.escape(item.user_id)}`;
              conn.query(sql, (err, result) => {
                if (err) throw err;
                resolve("true");
              });
            });

            await new Promise((resolve, reject) => {
              var sql = `UPDATE enrollments SET updated_at=NOW(),course_progress=${mysql.escape(
                0
              )},enrollment_status='failed',total_number=${mysql.escape(
                item.total_number
              )},score_number=${mysql.escape(
                item.score_number
              )} WHERE id=${mysql.escape(item.enroll_id)}`;
              conn.query(sql, (err, result) => {
                if (err) throw err;
                resolve("true");
              });
            });
          }
        }
      }
    }

    callback(false, null);
  }

  // ---------------------------------------------------
  async show(cid, fromd, tod, user_email, std_no, callback) {
    try {
      console.log(fromd);
      var user_id = "";
      var std_id = "";

      if (user_email) {
        var user_sql = `SELECT * FROM users WHERE email=${mysql.escape(
          user_email
        )}`;

        console.log(user_sql);

        user_id = await new Promise((resolve, reject) => {
          conn.query(user_sql, (err, result) => {
            if (err) throw err;

            if (result.length > 0) {
              console.log(result);
              resolve(result[0].id);
            } else {
              resolve(false);
            }
          });
        });
      }

      if (std_no) {
        var user_sql = `SELECT * FROM users WHERE user_hr_no=${mysql.escape(
          std_no
        )}`;

        console.log(user_sql);

        std_id = await new Promise((resolve, reject) => {
          conn.query(user_sql, (err, result) => {
            if (err) throw err;

            if (result.length > 0) {
              //console.log(result)
              resolve(result[0].id);
            } else {
              resolve(false);
            }
          });
        });
      }

      var sql = `SELECT enrollments.*,(SELECT rating_number FROM course_comments WHERE course_comments.user_id=enrollments.user_id AND course_comments.course_id=enrollments.course_id ) AS rating_number,(SELECT comment FROM course_comments WHERE course_comments.user_id=enrollments.user_id AND course_comments.course_id=enrollments.course_id ) AS comment FROM enrollments LEFT JOIN courses ON courses.id=enrollments.course_id  `;

      if (cid || fromd || tod || user_id || std_id) {
        sql = sql + " WHERE ";

        if (user_id) {
          sql = sql + ` courses.user_id=${user_id} `;
        }

        if (std_id) {
          if (user_id) {
            sql = sql + ` AND enrollments.user_id=${std_id} `;
          } else {
            sql = sql + ` enrollments.user_id=${std_id} `;
          }
        }

        if (cid) {
          if (user_id || std_id) {
            sql = sql + ` AND enrollments.course_id=${mysql.escape(cid)} `;
          } else {
            sql = sql + ` enrollments.course_id=${mysql.escape(cid)} `;
          }

          if (fromd && tod) {
            if (cid || user_id || std_id) {
              sql =
                sql +
                `AND  enrollments.date_at BETWEEN ${mysql.escape(
                  fromd
                )} AND ${mysql.escape(tod)} `;
            } else {
              sql =
                sql +
                `  enrollments.date_at BETWEEN ${mysql.escape(
                  fromd
                )} AND ${mysql.escape(tod)} `;
            }
          } else if (fromd) {
            if (cid || user_id || std_id) {
              sql = sql + `AND enrollments.date_at=${mysql.escape(fromd)} `;
            } else {
              sql = sql + ` enrollments.date_at=${mysql.escape(fromd)} `;
            }
          } else if (tod) {
            if (cid || user_id || std_id) {
              sql = sql + `AND enrollments.date_at <= ${mysql.escape(tod)} `;
            } else {
              sql = sql + ` enrollments.date_at <= ${mysql.escape(tod)} `;
            }
          }
        } else {
          if (fromd && tod) {
            if (cid || user_id || std_id) {
              sql =
                sql +
                `AND  enrollments.date_at BETWEEN ${mysql.escape(
                  fromd
                )} AND ${mysql.escape(tod)} `;
            } else {
              sql =
                sql +
                `  enrollments.date_at BETWEEN ${mysql.escape(
                  fromd
                )} AND ${mysql.escape(tod)} `;
            }
          } else if (fromd) {
            if (cid || user_id || std_id) {
              sql = sql + `AND enrollments.date_at=${mysql.escape(fromd)} `;
            } else {
              sql = sql + ` enrollments.date_at=${mysql.escape(fromd)} `;
            }
          } else if (tod) {
            if (cid || user_id || std_id) {
              sql = sql + `AND enrollments.date_at <= ${mysql.escape(tod)} `;
            } else {
              sql = sql + ` enrollments.date_at <= ${mysql.escape(tod)} `;
            }
          }
        }

        // if (user_id) {
        //     sql = sql + `AND `;
        // }
      }

      sql = sql + ` ORDER BY enrollments.ID DESC`;

      console.log(sql);

      conn.query(sql, async (err, results) => {
        if (err) {
          callback(true, err);
        } else {
          var Adata = [];
          for (var item of results) {
            var temp = {
              id: item.id,
              user_id: item.user_id,
              course_id: item.course_id,
              enrollment_status: item.enrollment_status,
              current_chapter: item.current_chapter,
              certificate_id: item.certificate_id,
              current_lession: item.current_lession,
              course_progress: item.course_progress,
              created_at: item.created_at,
              updated_at: item.updated_at,
              enrollment_create_date: Enrollment.formatDate(item.created_at),
              rating_number: item.rating_number,
              comment: item.comment,
              total_number: item.total_number,
              pass_number:item.pass_number,
              score_number: item.score_number,
              user_details: [],
              course_details: [],
              assignment_details: [],
            };

            var sql1 = `SELECT users.email as u_email,users.firstname as u_firstname,users.lastname as u_lastname,c.*,cl.id as course_languages_id,category.c_name as category_name FROM courses c LEFT JOIN course_languages cl ON cl.course_id=c.id LEFT JOIN category ON category.id=c.category_id LEFT JOIN users ON users.id=c.user_id WHERE c.published_status='active' AND c.approved_status='active' AND c.id=${item.course_id}`;
            // console.log(sql1)

            var cdata = await new Promise((resolve, reject) => {
              conn.query(sql1, async (err, result) => {
                if (err) {
                  callback(true, err);
                } else {
                  // console.log(result)
                  if (result.length > 0) {
                    var data = {
                      creator_name:
                        result[0].u_firstname + " " + result[0].u_lastname,
                      creator_email: result[0].u_email,
                      course_name: result[0].course_name,
                      xapi_file_name: result[0].xapi_file_name,
                      short_description: result[0].short_description,
                      id: result[0].id,
                      image:
                        result[0].image != null
                          ? process.env.images_path + `${result[0].image}`
                          : "",
                      avatar_image:
                        result[0].avatar_image != null
                          ? process.env.images_path +
                            `${result[0].avatar_image}`
                          : "",
                      attachment_file:
                        result[0].attachment_file != null
                          ? process.env.images_path +
                            `${result[0].attachment_file}`
                          : "",
                      course_level: result[0].course_level,
                      group_id: result[0].group_id,
                      category_name: result[0].category_name,
                      category_id: result[0].category_id,
                      sub_category_id: result[0].sub_category_id,
                      course_tag: null,
                      published_status: result[0].published_status,
                      approved_status: result[0].approved_status,
                      created_at: result[0].created_at,
                      updated_at: result[0].updated_at,
                      course_languages_id: result[0].course_languages_id,
                      course_type: result[0].course_type,
                      chapters: [],
                    };

                    // chapter details

                    var sql2 = `SELECT * FROM chapters WHERE course_id=${item.course_id}`;
                    //console.log(sql2)
                    var chapter_data = await new Promise(function (
                      resolve,
                      reject
                    ) {
                      conn.query(sql2, (err, result) => {
                        if (err) throw err;

                        if (result.length > 0) {
                          var data = [];
                          for (var i of result) {
                            var temp = {
                              id: i.id,
                              course_id: i.course_id,
                              chapter_name: i.chapter_name,
                              created_at: i.created_at,
                              updated_at: i.updated_at,
                              lessons: [],
                            };

                            data.push(temp);
                          }

                          resolve(data);
                        } else {
                          resolve([]);
                        }
                      });
                    });

                    //console.log(chapter_data)

                    data.chapters = chapter_data;

                    // lesson details
                    // console.log(data.chapters)
                    for (
                      let chapter = 0;
                      chapter < data.chapters.length;
                      chapter++
                    ) {
                      var sql2 = `SELECT * FROM lessons WHERE course_id=${item.course_id} and chapter_id=${data.chapters[chapter].id}`;

                      console.log(sql2);
                      var lesson = await new Promise(function (
                        resolve,
                        reject
                      ) {
                        conn.query(sql2, (err, result) => {
                          if (err) throw err;

                          if (result.length > 0) {
                            var data = [];
                            for (let i of result) {
                              var temp = {
                                id: i.id,
                                course_id: i.course_id,
                                chapter_id: i.chapter_id,
                                lesson_name: i.lesson_name,
                                lesson_vedio: i.lesson_vedio
                                  ? process.env.vedios_path + i.lesson_vedio
                                  : "",
                                lesson_file: i.lesson_vedio
                                  ? process.env.files_path + i.lesson_file
                                  : "",
                                lesson_details: i.lesson_details,
                                created_at: i.created_at,
                                updated_at: i.updated_at,
                              };
                              data.push(temp);
                            }

                            // console.log(result.length)

                            resolve(data);
                          } else {
                            resolve([]);
                          }
                        });
                      });

                      data.chapters[chapter].lessons = lesson;
                    }

                    //console.log(data);

                    resolve(data);
                  } else {
                    resolve(null);
                  }
                }
              });
            }).catch((err) => console.log(err));

            temp.course_details.push(cdata);

            var udata = await new Promise((resolve, reject) => {
              let data = {
                column: "id",
                value: item.user_id,
              };
              userModel.getUser(data, (err, result) => {
                if (err) throw err;

                if (result.length > 0) {
                  let tdata = [];

                  for (var i of result) {
                    var tt = {
                      id: i.id,
                      email: i.email,
                      firstname: i.firstname,
                      lastname: i.lastname,
                      fullname: i.firstname + " " + i.lastname,
                      user_hr_no: i.user_hr_no,
                    };

                    tdata.push(tt);
                  }

                  resolve(tdata);
                } else {
                  resolve(null);
                }
              });
            });

            temp.user_details = udata;

            var assignSql = `SELECT assignments.*,c.course_name,groups.g_name,users.email,users.firstname,users.lastname FROM assignments 
                    LEFT JOIN courses c ON c.id=assignments.course_id LEFT JOIN groups ON groups.id=assignments.user_group_id LEFT JOIN users ON users.id=assignments.user_id  WHERE assignments.course_id=${item.course_id} ORDER BY assignments.id DESC `;
            var assigmentData = await new Promise(function (resolve, reject) {
              conn.query(assignSql, (err, result) => {
                if (err) throw err;

                if (result.length > 0) {
                  var tempData = [];

                  for (var i of result) {
                    var temp = {
                      id: i.id,
                      assignment_name: i.assignment_name,
                      user_group_id: i.user_group_id,
                      group_name: i.g_name,
                      user_id: i.user_id,
                      course_id: i.course_id,
                      course_name: i.course_name,
                      assigment_file: i.assigment_file
                        ? process.env.files_path + i.assigment_file
                        : "",
                      assigment_desc: i.assigment_desc,
                      assigment_duration: i.assigment_duration,
                      assignment_create: Enrollment.formatDate(i.created_at),
                      assignment_deadline: Enrollment.addDays(
                        i.created_at,
                        i.assigment_duration
                      ),
                      created_by: i.email,
                      user_name: i.firstname + " " + i.lastname,
                      created_at: i.created_at,
                      updated_at: i.updated_at,
                    };

                    tempData.push(temp);
                  }

                  resolve(tempData);
                } else {
                  resolve(null);
                }
              });
            });

            temp.assignment_details = assigmentData;

            // final array
            Adata.push(temp);
          }
          callback(false, Adata);
        }
      });
    } catch (err) {
      console.log(err);
    }
  }

  delete(status, id, callback) {
    if (status === "active") {
      status = "inactive";
    } else {
      status = "active";
    }

    var sql = `UPDATE enrollments SET user_enroll_status='${status}' WHERE id=?`;
    conn.query(sql, id, (err, result) => {
      if (err) {
        callback(true, err);
      } else {
        callback(false, result);
      }
    });
  }

  // for creatoe
  async getAllEnrollmentUserList(id, callback) {
    var sql = `SELECT * FROM courses WHERE user_id=${mysql.escape(id)}`;

    console.log(sql);

    var courseIdList = await new Promise((resolve, reject) => {
      conn.query(sql, (err, result) => {
        if (err) throw err;

        if (result.length > 0) {
          var temp = "";

          for (var i of result) {
            temp += `${i.id},`;
          }

          temp = temp.slice(0, -1);
          resolve(temp);
        } else {
          resolve(null);
        }
      });
    });

    var sql1 = `SELECT * FROM enrollments WHERE course_id IN (${courseIdList})`;
    console.log(sql1);

    conn.query(sql1, async (err, results) => {
      if (err) {
        callback(true, err);
      } else {
        console.log(results);

        var Adata = [];
        for (var item of results) {
          var temp = {
            id: item.id,
            creator_id: id,
            user_id: item.user_id,
            course_id: item.course_id,
            enrollment_status: item.enrollment_status,
            current_chapter: item.current_chapter,
            current_lession: item.current_lession,
            course_progress: item.course_progress,
            created_at: item.created_at,
            updated_at: item.updated_at,
            enrollment_create_date: Enrollment.formatDate(item.created_at),
            user_details: [],
            course_details: [],
            assignment_details: [],
          };

          var sql1 = `SELECT users.firstname as u_firstname,users.lastname as u_lastname,c.*,cl.id as course_languages_id,category.c_name as category_name FROM courses c LEFT JOIN course_languages cl ON cl.course_id=c.id LEFT JOIN category ON category.id=c.category_id LEFT JOIN users ON users.id=c.user_id WHERE c.published_status='active' AND c.approved_status='active' AND c.id=${item.course_id}`;
          // console.log(sql1)

          var cdata = await new Promise((resolve, reject) => {
            conn.query(sql1, async (err, result) => {
              if (err) {
                callback(true, err);
              } else {
                // console.log(result)
                if (result.length > 0) {
                  var data = {
                    creator_name:
                      result[0].u_firstname + " " + result[0].u_lastname,
                    course_name: result[0].course_name,
                    short_description: result[0].short_description,
                    id: result[0].id,
                    image:
                      result[0].image != null
                        ? process.env.images_path + `${result[0].image}`
                        : "",
                    avatar_image:
                      result[0].avatar_image != null
                        ? process.env.images_path + `${result[0].avatar_image}`
                        : "",
                    attachment_file:
                      result[0].attachment_file != null
                        ? process.env.images_path +
                          `${result[0].attachment_file}`
                        : "",
                    course_level: result[0].course_level,
                    group_id: result[0].group_id,
                    category_name: result[0].category_name,
                    category_id: result[0].category_id,
                    sub_category_id: result[0].sub_category_id,
                    course_tag: null,
                    published_status: result[0].published_status,
                    approved_status: result[0].approved_status,
                    created_at: result[0].created_at,
                    updated_at: result[0].updated_at,
                    course_languages_id: result[0].course_languages_id,
                    chapters: [],
                  };

                  // chapter details

                  var sql2 = `SELECT * FROM chapters WHERE course_id=${item.course_id}`;
                  //console.log(sql2)
                  var chapter_data = await new Promise(function (
                    resolve,
                    reject
                  ) {
                    conn.query(sql2, (err, result) => {
                      if (err) throw err;

                      if (result.length > 0) {
                        var data = [];
                        for (var i of result) {
                          var temp = {
                            id: i.id,
                            course_id: i.course_id,
                            chapter_name: i.chapter_name,
                            created_at: i.created_at,
                            updated_at: i.updated_at,
                            lessons: [],
                          };

                          data.push(temp);
                        }

                        resolve(data);
                      } else {
                        resolve(null);
                      }
                    });
                  });

                  //console.log(chapter_data)

                  data.chapters = chapter_data;

                  // lesson details
                  // console.log(data.chapters)
                  for (
                    let chapter = 0;
                    chapter < data.chapters.length;
                    chapter++
                  ) {
                    var sql2 = `SELECT * FROM lessons WHERE course_id=${item.course_id} and chapter_id=${data.chapters[chapter].id}`;

                    console.log(sql2);
                    var lesson = await new Promise(function (resolve, reject) {
                      conn.query(sql2, (err, result) => {
                        if (err) throw err;

                        if (result.length > 0) {
                          var data = [];
                          for (let i of result) {
                            var temp = {
                              id: i.id,
                              course_id: i.course_id,
                              chapter_id: i.chapter_id,
                              lesson_name: i.lesson_name,
                              lesson_vedio: i.lesson_vedio
                                ? process.env.vedios_path + i.lesson_vedio
                                : "",
                              lesson_file: i.lesson_vedio
                                ? process.env.files_path + i.lesson_file
                                : "",
                              lesson_details: i.lesson_details,
                              created_at: i.created_at,
                              updated_at: i.updated_at,
                            };
                            data.push(temp);
                          }

                          // console.log(result.length)

                          resolve(data);
                        } else {
                          resolve([]);
                        }
                      });
                    });

                    data.chapters[chapter].lessons = lesson;
                  }

                  //console.log(data);

                  resolve(data);
                } else {
                  resolve(null);
                }
              }
            });
          }).catch((err) => console.log(err));

          temp.course_details.push(cdata);

          var udata = await new Promise((resolve, reject) => {
            let data = {
              column: "id",
              value: item.user_id,
            };
            userModel.getUser(data, (err, result) => {
              if (err) throw err;

              if (result.length > 0) {
                let tdata = [];

                for (var i of result) {
                  var tt = {
                    id: i.id,
                    email: i.email,
                    firstname: i.firstname,
                    lastname: i.lastname,
                    fullname: i.firstname + " " + i.lastname,
                  };

                  tdata.push(tt);
                }

                resolve(tdata);
              } else {
                resolve(null);
              }
            });
          });

          temp.user_details = udata;

          var assignSql = `SELECT assignments.*,c.course_name,groups.g_name,users.email,users.firstname,users.lastname FROM assignments 
                LEFT JOIN courses c ON c.id=assignments.course_id LEFT JOIN groups ON groups.id=assignments.user_group_id LEFT JOIN users ON users.id=assignments.user_id  WHERE assignments.course_id=${item.course_id} ORDER BY assignments.id DESC `;
          var assigmentData = await new Promise(function (resolve, reject) {
            conn.query(assignSql, (err, result) => {
              if (err) throw err;

              if (result.length > 0) {
                var tempData = [];

                for (var i of result) {
                  var temp = {
                    id: i.id,
                    assignment_name: i.assignment_name,
                    user_group_id: i.user_group_id,
                    group_name: i.g_name,
                    user_id: i.user_id,
                    course_id: i.course_id,
                    course_name: i.course_name,
                    assigment_file: i.assigment_file
                      ? process.env.files_path + i.assigment_file
                      : "",
                    assigment_desc: i.assigment_desc,
                    assigment_duration: i.assigment_duration,
                    assignment_create: Enrollment.formatDate(i.created_at),
                    assignment_deadline: Enrollment.addDays(
                      i.created_at,
                      i.assigment_duration
                    ),
                    created_by: i.email,
                    user_name: i.firstname + " " + i.lastname,
                    created_at: i.created_at,
                    updated_at: i.updated_at,
                  };

                  tempData.push(temp);
                }

                resolve(tempData);
              } else {
                resolve(null);
              }
            });
          });

          temp.assignment_details = assigmentData;

          // final array
          Adata.push(temp);
        }
        callback(false, Adata);
      }
    });
  }

  async showBYCourseOrUser(data, callback) {
    const { course_id, user_id } = data;
    var sql = "";

    var sql_user_chk = `SELECT * FROM users where id=${user_id}`;

    var userChk = await new Promise((resolve, reject) => {
      conn.query(sql_user_chk, (err, result) => {
        if (err) throw err;
        //console.log("wwwwwwwwwwww",result)
        if (result.length > 0) {
          resolve(result[0]);
        } else {
          resolve(null);
        }
      });
    });

    // console.log(userChk.role);

    if (userChk.role != 4) {
      if (course_id && user_id) {
        sql = `SELECT *,(SELECT rating_number FROM course_comments WHERE course_comments.user_id=enrollments.user_id AND course_comments.course_id=enrollments.course_id ) AS rating_number,(SELECT comment FROM course_comments WHERE course_comments.user_id=enrollments.user_id AND course_comments.course_id=enrollments.course_id ) AS comment FROM enrollments WHERE user_id=${user_id} AND course_id=${course_id} AND user_enroll_status='active' ORDER BY id DESC`;
      }
      // else if (course_id) {
      //     sql = `SELECT * FROM enrollments WHERE course_id=${course_id} ORDER BY id DESC`;
      // }
      else if (user_id) {
        sql = `SELECT *,(SELECT rating_number FROM course_comments WHERE course_comments.user_id=enrollments.user_id AND course_comments.course_id=enrollments.course_id ) AS rating_number,(SELECT comment FROM course_comments WHERE course_comments.user_id=enrollments.user_id AND course_comments.course_id=enrollments.course_id ) AS comment FROM enrollments WHERE user_id=${user_id} AND user_enroll_status='active' ORDER BY id DESC`;
      }
    } else {
    }

    if (sql) {
      var edata = await new Promise((resolve, reject) => {
        conn.query(sql, (err, result) => {
          if (err) throw err;
          if (result.length > 0) {
            resolve(result);
          } else {
            resolve(null);
          }
        });
      });

      if (edata != null) {
        var assignmentData = [];

        console.log("sssss", edata);

        for (var item of edata) {
          var Adata = {
            user_id: item.user_id,
            course_id: item.course_id,
            enroll_id: item.id,
            enrollment_status: item.enrollment_status,
            user_enroll_status: item.user_enroll_status,
            current_chapter: item.current_chapter,
            current_lession: item.current_lession,
            course_progress: item.course_progress,
            created_at: item.created_at,
            updated_at: item.updated_at,
            enrollment_create_date: Enrollment.formatDate(item.created_at),
            rating_number: item.rating_number,
            comment: item.comment,
            user_details: [],
            course_details: [],
            assignment_details: [],
          };

          var sql1 = `SELECT users.email as u_email,users.firstname as u_firstname,users.lastname as u_lastname,c.*,cl.id as course_languages_id,category.c_name as category_name FROM courses c LEFT JOIN course_languages cl ON cl.course_id=c.id LEFT JOIN category ON category.id=c.category_id LEFT JOIN users ON users.id=c.user_id WHERE c.published_status='active' AND c.approved_status='active' AND c.id=${item.course_id}`;
          // console.log(sql1)

          var cdata = await new Promise((resolve, reject) => {
            conn.query(sql1, async (err, result) => {
              if (err) {
                callback(true, err);
              } else {
                // console.log(result)
                if (result.length > 0) {
                  var data = {
                    course_type: result[0].course_type,
                    course_certificate_name:result[0].course_certificate_name,
                    creator_name:
                      result[0].u_firstname + " " + result[0].u_lastname,
                    creator_email: result[0].u_email,
                    course_name: result[0].course_name,
                    xapi_file_name: result[0].xapi_file_name
                      ? result[0].xapi_file_name
                      : "",
                    certificate_id: result[0].certificate_id,
                    short_description: result[0].short_description,
                    id: result[0].id,
                    image:
                      result[0].image != null
                        ? process.env.images_path + `${result[0].image}`
                        : "",
                    avatar_image:
                      result[0].avatar_image != null
                        ? process.env.images_path + `${result[0].avatar_image}`
                        : "",
                    attachment_file:
                      result[0].attachment_file != null
                        ? process.env.images_path +
                          `${result[0].attachment_file}`
                        : "",
                    course_level: result[0].course_level,
                    group_details: [],
                    category_id: result[0].category_id,
                    category_name: result[0].category_name,
                    sub_category_id: result[0].sub_category_id,
                    course_tag: null,
                    published_status: result[0].published_status,
                    approved_status: result[0].approved_status,
                    created_at: result[0].created_at,
                    updated_at: result[0].updated_at,
                    course_languages_id: result[0].course_languages_id,
                    chapters: [],
                    no_attempted: 0,
                  };

                  // calculate no of attempt --------------------
                  if (data.course_type == "xapi") {
                    var sql = `SELECT user_task.* FROM task LEFT JOIN user_task ON user_task.task_id=task.id WHERE task.course_id=${mysql.escape(
                      item.course_id
                    )} AND user_task.user_id=${mysql.escape(user_id)}`;

                    var no_attempted = await new Promise((resolve, reject) => {
                      conn.query(sql, (err, result) => {
                        if (err) throw err;

                        if (result.length > 0) resolve(result[0].no_attempted);
                        else resolve(0);
                      });
                    });
                    data.no_attempted = no_attempted;
                  }

                  // group details
                  var sql = `SELECT course_group.*,groups.g_name FROM course_group LEFT JOIN groups on groups.id=course_group.group_id WHERE course_group.course_id=${item.course_id}`;

                  var groups = await new Promise((resolve, reject) => {
                    conn.query(sql, (err, result) => {
                      if (err) throw err;
                      resolve(result);
                    });
                  });
                  data.group_details = groups;

                  // chapter details

                  var sql2 = `SELECT * FROM chapters WHERE course_id=${item.course_id}`;
                  //console.log(sql2)
                  var chapter_data = await new Promise(function (
                    resolve,
                    reject
                  ) {
                    conn.query(sql2, (err, result) => {
                      if (err) throw err;

                      if (result.length > 0) {
                        var data = [];
                        for (var i of result) {
                          var temp = {
                            id: i.id,
                            course_id: i.course_id,
                            chapter_name: i.chapter_name,
                            created_at: i.created_at,
                            updated_at: i.updated_at,
                            lessons: [],
                          };

                          data.push(temp);
                        }

                        resolve(data);
                      } else {
                        resolve([]);
                      }
                    });
                  });

                  //console.log(chapter_data)

                  data.chapters = chapter_data;

                  // lesson details
                  // console.log(data.chapters)
                  for (
                    let chapter = 0;
                    chapter < data.chapters.length;
                    chapter++
                  ) {
                    var sql2 = `SELECT * FROM lessons WHERE course_id=${item.course_id} and chapter_id=${data.chapters[chapter].id}`;

                    console.log(sql2);
                    var lesson = await new Promise(function (resolve, reject) {
                      conn.query(sql2, (err, result) => {
                        if (err) throw err;

                        if (result.length > 0) {
                          var data = [];
                          for (let i of result) {
                            var temp = {
                              id: i.id,
                              course_id: i.course_id,
                              chapter_id: i.chapter_id,
                              lesson_name: i.lesson_name,
                              lesson_vedio: i.lesson_vedio
                                ? process.env.vedios_path + i.lesson_vedio
                                : "",
                              lesson_file: i.lesson_vedio
                                ? process.env.files_path + i.lesson_file
                                : "",
                              lesson_details: i.lesson_details,
                              created_at: i.created_at,
                              updated_at: i.updated_at,
                            };
                            data.push(temp);
                          }

                          // console.log(result.length)

                          resolve(data);
                        } else {
                          resolve([]);
                        }
                      });
                    });

                    data.chapters[chapter].lessons = lesson;
                  }

                  //console.log(data);

                  resolve(data);
                } else {
                  resolve(null);
                }
              }
            });
          }).catch((err) => console.log(err));

          cdata != null
            ? Adata.course_details.push(cdata)
            : (Adata.course_details = []);

          var udata = await new Promise((resolve, reject) => {
            let data = {
              column: "id",
              value: item.user_id,
            };
            userModel.getUser(data, (err, result) => {
              if (err) throw err;

              if (result.length > 0) {
                let tdata = [];

                for (var i of result) {
                  var tt = {
                    id: i.id,
                    email: i.email,
                    firstname: i.firstname,
                    lastname: i.lastname,
                    fullname: i.firstname + " " + i.lastname,
                    role: i.role,
                    user_hr_no: i.user_hr_no,
                  };

                  tdata.push(tt);
                }

                resolve(tdata);
              } else {
                resolve(null);
              }
            });
          });

          Adata.user_details = udata;

          var assignSql = `SELECT assignments.*,c.course_name,groups.g_name,users.email,users.firstname,users.lastname FROM assignments 
                    LEFT JOIN courses c ON c.id=assignments.course_id LEFT JOIN groups ON groups.id=assignments.user_group_id LEFT JOIN users ON users.id=assignments.user_id  WHERE assignments.course_id=${item.course_id} ORDER BY assignments.id DESC `;
          var assigmentData = await new Promise(function (resolve, reject) {
            conn.query(assignSql, (err, result) => {
              if (err) throw err;

              if (result.length > 0) {
                var tempData = [];

                for (var i of result) {
                  var temp = {
                    id: i.id,
                    assignment_name: i.assignment_name,
                    user_group_id: i.user_group_id,
                    group_name: i.g_name,
                    user_id: i.user_id,
                    course_id: i.course_id,
                    course_name: i.course_name,
                    assigment_file: i.assigment_file
                      ? process.env.files_path + i.assigment_file
                      : "",
                    assigment_desc: i.assigment_desc,
                    assigment_duration: i.assigment_duration,
                    assignment_create: Enrollment.formatDate(i.created_at),
                    assignment_deadline: Enrollment.addDays(
                      i.created_at,
                      i.assigment_duration
                    ),
                    created_by: i.email,
                    user_name: i.firstname + " " + i.lastname,
                    created_at: i.created_at,
                    updated_at: i.updated_at,
                  };

                  tempData.push(temp);
                }

                resolve(tempData);
              } else {
                resolve(null);
              }
            });
          });

          Adata.assignment_details = assigmentData;

          // final arry
          assignmentData.push(Adata);
        }
        callback(false, assignmentData);
      } else {
        callback(true, null);
      }
    } else {
      callback(true, null);
    }
  }

  static formatDate(date) {
    var d = new Date(date);
    var month = "" + (d.getMonth() + 1);
    var day = "" + d.getDate();
    var year = d.getFullYear();

    if (month.length < 2) month = "0" + month;
    if (day.length < 2) day = "0" + day;

    return [year, month, day].join("-");
  }

  static addDays(date, days) {
    var result = new Date(date);
    result.setDate(result.getDate() + (days - 1));
    //return result;

    var d = result;
    var month = "" + (d.getMonth() + 1);
    var day = "" + d.getDate();
    var year = d.getFullYear();

    if (month.length < 2) month = "0" + month;
    if (day.length < 2) day = "0" + day;

    return [year, month, day].join("-");
  }
}

module.exports = new Enrollment();
