const conn = require("../config/dbconfig");
const mysql = require("mysql");
require("dotenv").config();

class Courses {
  create(data, callback) {
    const sql = `INSERT INTO courses(course_name,user_id, short_description, image, avatar_image,attachment_file, course_level,sub_category_id, category_id, course_tag, published_status,xapi_attachment_file,course_type,created_at,long_description,certificate_id,xapi_file_name,course_certificate_name,author_name,author_email)
        VALUES 
        (${mysql.escape(data.course_name)},
        ${mysql.escape(data.user_id)},
        ${mysql.escape(data.short_description)},
        ${mysql.escape(data.image)},
        ${mysql.escape(data.avatar_image)},
        ${mysql.escape(data.attachment_file)},
        ${mysql.escape(data.course_level)},
        ${mysql.escape(data.sub_category_id)},
        ${mysql.escape(data.category_id)},
        ${mysql.escape(data.course_tag)},
        ${mysql.escape(data.published_status)},
        ${mysql.escape(data.xapi_attachment_file)},
        ${mysql.escape(data.course_type)},
        NOW(),
        ${mysql.escape(data.long_description)}, 
        ${mysql.escape(data.certificate_id)},
        ${mysql.escape(data.xapi_file_name)},
        ${mysql.escape(data.course_certificate_name)},
        ${mysql.escape(data.author_name)},
        ${mysql.escape(data.author_email)})`;

    console.log(sql);

    conn.query(sql, async (err, result) => {
      console.log(err);
      if (err) {
        callback(true, err);
      } else {
        //  console.log(result.insertId)

        await new Promise((resolve, reject) => {
          this.courseLangInsert(data.lang, result.insertId, (err2, result2) => {
            if (err2) {
              resolve(false);
            } else {
              resolve(true);
            }
          });
        });

        var ss = "";
        var sql3 = `INSERT INTO course_group (course_id,group_id) VALUES `;
        for (var item of data.group_id) {
          ss += ` (
                 ${mysql.escape(result.insertId)},
                    ${mysql.escape(Number(item))}
                ),`;
        }

        sql3 = sql3 + ss;

        sql3 = sql3.slice(0, -1);

        // console.log(sql3);

        conn.query(sql3, (err, result) => {
          if (err) {
            callback(true, null);
          } else {
            callback(false, result);
          }
        });
      }
    });
  }

  chkXapiFileName(data, callback) {
    var sql = `SELECT * FROM courses WHERE xapi_file_name=${mysql.escape(
      data.xapi_file_name
    )}`;
    conn.query(sql, (err, result) => {
      if (err) throw err;
      if (result.length > 0) callback(true);
      else callback(false);
    });
  }

  show(id, callback) {
    if (!id) {
      var sql = `SELECT * FROM courses order by id desc`;

      conn.query(sql, async (err, result) => {
        if (err) {
          callback(true, err);
        } else {
          var data = [];

          for (var item of result) {
            const sql2 = `SELECT c_name from category WHERE id=${item.category_id}`;
            const parentCatagoryName = await new Promise(function (
              resolve,
              reject
            ) {
              conn.query(sql2, (err2, result2) => {
                if (err2) throw err2;

                if (result2.length > 0) {
                  resolve(result2);
                } else {
                  resolve(null);
                }
              });
            });

            const sql3 = `SELECT firstname,lastname from users WHERE id=${mysql.escape(
              item.user_id
            )}`;
            const creators = await new Promise(function (resolve, reject) {
              conn.query(sql3, (err3, result3) => {
                if (err3) throw err3;

                if (result3.length > 0) {
                  //console.log(result3
                  var name = result3[0].firstname + " " + result3[0].lastname;
                  resolve(name);
                } else {
                  resolve(null);
                }
              });
            });

            var temp = {
              course_name: item.course_name,
              xapi_file_name: item.xapi_file_name?item.xapi_file_name:'',
              creator_name: creators,
              short_description: item.short_description,
              long_description: item.long_description,
              id: item.id,
              image:
                item.image != null
                  ? process.env.images_path + `${item.image}`
                  : "",
              avatar_image:
                item.avatar_image != null
                  ? process.env.images_path + `${item.avatar_image}`
                  : "",
              attachment_file:
                item.attachment_file != null
                  ? process.env.images_path + `${item.attachment_file}`
                  : "",
              course_level: item.course_level,
              group_id: item.group_id,
              category_id: item.category_id,
              category_name:
                parentCatagoryName != null
                  ? parentCatagoryName[0].c_name
                  : null,
              sub_category_id: item.sub_category_id,
              course_tag: null,
              published_status: item.published_status,
              approved_status: item.approved_status,
              created_at: item.created_at,
              updated_at: item.updated_at,
              course_languages_id: item.course_languages_id,
              course_type: item.course_type,
              course_certificate_name:item.course_certificate_name
            };

            data.push(temp);
          }

          callback(false, data);
        }
      });
    } else {
      var sql = `SELECT c.*,cl.language_id as course_languages_id FROM courses c LEFT JOIN course_languages cl ON cl.course_id=c.id WHERE c.id=?`;

      conn.query(sql, id, async (err, result) => {
        if (err) {
          callback(true, err);
        } else {
          var data = {
            course_name: result[0].course_name,
            xapi_file_name: result[0].xapi_file_name?result[0].xapi_file_name:'',
            user_id: result[0].user_id,
            short_description: result[0].short_description,
            long_description: result[0].long_description,
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
                ? process.env.images_path + `${result[0].attachment_file}`
                : "",
            course_level: result[0].course_level,
            group_details: [],
            category_id: result[0].category_id,
            sub_category_id: result[0].sub_category_id,
            course_tag: null,
            published_status: result[0].published_status,
            approved_status: result[0].approved_status,
            created_at: result[0].created_at,
            updated_at: result[0].updated_at,
            course_type: result[0].course_type,
            course_certificate_name:result[0].course_certificate_name,
            xapi_attachment_file:
              result[0].xapi_attachment_file != null
                ? process.env.xapi_file_path +
                  `${result[0].xapi_attachment_file}`
                : "",
            course_languages_id: result[0].course_languages_id,
            certificate_id: result[0].certificate_id
              ? result[0].certificate_id
              : "",
              author_name:result[0].author_name,
              author_email:result[0].author_email
          };

          var sql = `SELECT course_group.*,groups.g_name FROM course_group LEFT JOIN groups on groups.id=course_group.group_id WHERE course_group.course_id=${data.id}`;

          var groups = await new Promise((resolve, reject) => {
            conn.query(sql, (err, result) => {
              if (err) throw err;
              resolve(result);
            });
          });
          data.group_details = groups;
          callback(false, data);
        }
      });
    }
  }

  showByCreatorId(id, callback) {
    var sql = `SELECT * FROM courses WHERE user_id=${mysql.escape(
      id
    )} order by id desc`;

    conn.query(sql, async (err, result) => {
      if (err) {
        callback(true, err);
      } else {
        var data = [];

        for (var item of result) {
          const sql2 = `SELECT c_name from category WHERE id=${item.category_id}`;
          const parentCatagoryName = await new Promise(function (
            resolve,
            reject
          ) {
            conn.query(sql2, (err2, result2) => {
              if (err2) throw err2;

              if (result2.length > 0) {
                resolve(result2);
              } else {
                resolve(null);
              }
            });
          });

          var temp = {
            course_name: item.course_name,
            xapi_file_name: item.xapi_file_name?item.xapi_file_name:'',
            short_description: item.short_description,
            long_description: item.long_description,
            id: item.id,
            image:
              item.image != null
                ? process.env.images_path + `${item.image}`
                : "",
            avatar_image:
              item.avatar_image != null
                ? process.env.images_path + `${item.avatar_image}`
                : "",
            attachment_file:
              item.attachment_file != null
                ? process.env.images_path + `${item.attachment_file}`
                : "",
            course_level: item.course_level,
            group_id: item.group_id,
            category_id: item.category_id,
            category_name:
              parentCatagoryName != null ? parentCatagoryName[0].c_name : null,
            sub_category_id: item.sub_category_id,
            course_tag: null,
            published_status: item.published_status,
            approved_status: item.approved_status,
            created_at: item.created_at,
            updated_at: item.updated_at,
            course_languages_id: item.course_languages_id,
            course_type: item.course_type,
            author_name:item.author_name,
              author_email:item.author_email
          };

          data.push(temp);
        }

        callback(false, data);
      }
    });
  }

  update(data, id, group_arr, lang, callback) {
    var sql = `UPDATE courses SET updated_at=NOW(),? WHERE id=?`;

    conn.query(sql, [data, id], async (err, result) => {
      console.log("course err", err);

      if (err) {
        callback(true, err);
      } else {
        //  console.log(result.insertId)
        await new Promise((resolve, reject) => {
          this.courseLangInsert(lang, id, (err2, result2) => {
            if (err2) {
              resolve(false);
            } else {
              resolve(true);
            }
          });
        });

        var dsql = `DELETE FROM course_group WHERE course_id=${mysql.escape(
          id
        )}`;
        var d_status = await new Promise((resolve, reject) => {
          conn.query(dsql, (err, result) => {
            if (err) {
              resolve(false);
            } else {
              resolve(true);
            }
          });
        });

        if (d_status) {
          var ss = "";
          var sql3 = `INSERT INTO course_group (course_id,group_id) VALUES `;
          for (var item of group_arr) {
            ss += ` (
                 ${mysql.escape(id)},
                    ${mysql.escape(Number(item))}
                ),`;
          }

          sql3 = sql3 + ss;

          sql3 = sql3.slice(0, -1);

          // console.log(sql3);

          conn.query(sql3, (err, result) => {
            if (err) {
              callback(true, null);
            } else {
              callback(false, result);
            }
          });
        }
      }
    });
  }

  courseLangInsert(data, id, callback) {
    const sql = `DELETE  FROM course_languages WHERE course_id=?`;

    conn.query(sql, id, (err, result) => {
      if (err) {
        callback(true, err);
      } else {
        var sql2 = `insert into course_languages(course_id,language_id) values  `;

        var temp = "";
        var tempArr = data.split(",");
        tempArr.forEach((item) => {
          temp += `(${mysql.escape(id)},${mysql.escape(item)}),`;
        });

        temp = temp.slice(0, -1);

        sql2 = sql2 + temp;

        console.log(sql2);

        conn.query(sql2, (err2, result2) => {
          if (err2) {
            callback(true, err2);
          } else {
            callback(false, result2);
          }
        });
      }
    });
  }

  async delete(id, callback) {
    // var sql = `DELETE FROM courses WHERE id=${id}`;
    // conn.query(sql, (err, result) => {
    //     if (err) {
    //         callback(true, err)
    //     }
    //     else {
    //         callback(false, result)
    //     }
    // })

    var sql = `SELECT * FROM enrollments WHERE course_id=${id}`;

    var enroll = await new Promise((resolve, reject) => {
      conn.query(sql, (err, result) => {
        if (err) throw err;

        if (result.length > 0) {
          resolve(true);
        } else {
          resolve(false);
        }
      });
    });

    if (!enroll) {
      var sql3 = `DELETE FROM courses where id=${mysql.escape(id)}`;

      var chkCourse = await new Promise((resolve, reject) => {
        conn.query(sql3, async (err, result) => {
          if (err) {
            resolve(false);
          } else {
            var sql = `DELETE FROM course_group WHERE course_id=${mysql.escape(
              id
            )}`;

            var c_group = await new Promise((resolve, reject) => {
              conn.query(sql, (err, result) => {
                if (err) throw err;
                resolve(true);
              });
            });

            if (c_group) {
              resolve(true);
            } else {
              resolve(false);
            }
          }
        });
      });

      if (chkCourse) {
        var sql3 = `DELETE FROM chapters where course_id=${mysql.escape(id)}`;

        var chkChapter = await new Promise((resolve, reject) => {
          conn.query(sql3, (err, result) => {
            if (err) {
              resolve(false);
            } else {
              resolve(true);
            }
          });
        });

        if (chkChapter) {
          var sql3 = `DELETE FROM lessons where course_id=${mysql.escape(id)}`;

          var chkLesson = await new Promise((resolve, reject) => {
            conn.query(sql3, (err, result) => {
              if (err) {
                resolve(false);
              } else {
                resolve(true);
              }
            });
          });

          if (chkLesson) {
            var sql3 = `DELETE FROM assignments where course_id=${mysql.escape(
              id
            )}`;

            var chkAssignment = await new Promise((resolve, reject) => {
              conn.query(sql3, (err, result) => {
                if (err) {
                  resolve(false);
                } else {
                  resolve(true);
                }
              });
            });

            if (chkAssignment) {
              callback(false, "delete successfully");
            } else {
              callback(true, null);
            }
          }
        }
      }
    } else {
      callback(true, "course allready enroll, so course can't delete");
    }
  }

  // category wise show
  async categoryWiseShow(category, callback) {
    var listCate = await new Promise((resolve, reject) => [
      this.listOfCategory(category, (rid) => {
        resolve(rid);
      }),
    ]);

    console.log(listCate);

    var sql = `SELECT * FROM courses WHERE category_id IN (${mysql.escape(
      listCate
    )}) AND 
        published_status='active' AND approved_status='active' `;

    console.log(sql);

    conn.query(sql, async (err, result) => {
      if (err) throw err;

      if (result.length > 0) {
        var data = [];

        for (let item of result) {
          var temp = {
            id: item.id,
            user_id: item.user_id,
            course_name: item.course_name,
            short_description: item.short_description,
            long_description: item.long_description,
            image: item.image ? process.env.images_path + item.image : "",
            avatar_image: item.avatar_image
              ? process.env.images_path + item.avatar_image
              : "",
            attachment_file: item.attachment_file
              ? process.env.images_path + item.attachment_file
              : "",
            course_level: item.course_level,
            group_id: item.group_id,
            group_details: [],
            category_id: item.category_id,
            sub_category_id: item.sub_category_id,
            course_tag: item.course_tag,
            rating: item.rating,
            published_status: item.published_status,
            approved_status: item.approved_status,
            created_at: item.created_at,
            updated_at: item.updated_at,
          };

          // group details add
          var sql = `SELECT course_group.*,groups.g_name FROM course_group LEFT JOIN groups on groups.id=course_group.group_id WHERE course_group.course_id=${item.id}`;

          var groups = await new Promise((resolve, reject) => {
            conn.query(sql, (err, result) => {
              if (err) throw err;
              resolve(result);
            });
          });
          temp.group_details = groups;

          data.push(temp);
        }

        //  console.log(data)
        callback(false, data);
      } else {
        callback(true, result);
      }
    });
  }

  // retrn list of category and subcategory
  async listOfCategory(id, callback) {
    var allCat = [];
    allCat.push(Number(id));

    var sql1 = `SELECT * from category WHERE id=${mysql.escape(id)}`;

    var pcat = await new Promise((resolve, reject) => {
      conn.query(sql1, (err, result) => {
        if (err) throw err;

        if (result.length > 0) {
          resolve(result[0].c_parent_id);
        } else {
          resolve(null);
        }
      });
    });

    if (pcat == 0) {
      // super parent category
      var sql2 = `SELECT * FROM category WHERE c_parent_id=${mysql.escape(id)}`;

      var subcat = await new Promise((resolve, reject) => {
        conn.query(sql2, (err, result) => {
          if (err) throw err;

          if (result.length > 0) {
            resolve(result);
          } else {
            resolve(null);
          }
        });
      });

      for (var i of subcat) {
        await this.chkSubcategory(i.id, id, (rid) => {
          if (this.isInArray(i.id, allCat) == false) {
            allCat.push(rid);
          }
        });

        //console.log(i.id);
        if (this.isInArray(i.id, allCat) == false) {
          allCat.push(i.id);
        }
      }
      callback(allCat);
    } else {
      if (pcat != null) {
        // parent category
        var sql2 = `SELECT * FROM category WHERE c_parent_id=${mysql.escape(
          id
        )}`;

        var subcat = await new Promise((resolve, reject) => {
          conn.query(sql2, (err, result) => {
            if (err) throw err;

            if (result.length > 0) {
              resolve(result);
            } else {
              resolve(null);
            }
          });
        });

        if (subcat != null) {
          for (var i of subcat) {
            await this.chkSubcategory(i.id, id, (rid) => {
              if (this.isInArray(i.id, allCat) == false) {
                allCat.push(rid);
              }
            });

            //console.log(i.id);
            if (this.isInArray(i.id, allCat) == false) {
              allCat.push(i.id);
            }
          }
          callback(allCat);
        } else {
          // child category
          var sql2 = `SELECT * FROM category WHERE id=${mysql.escape(id)}`;

          var subcat = await new Promise((resolve, reject) => {
            conn.query(sql2, (err, result) => {
              if (err) throw err;

              if (result.length > 0) {
                resolve(result);
              } else {
                resolve(null);
              }
            });
          });

          for (var i of subcat) {
            await this.chkSubcategory(i.id, id, (rid) => {
              if (this.isInArray(i.id, allCat) == false) {
                allCat.push(rid);
              }
            });

            //console.log(i.id);
            if (this.isInArray(i.id, allCat) == false) {
              allCat.push(i.id);
            }
          }
          callback(allCat);
        }
      } else {
        callback(allCat);
      }
    }
  }

  // check subcategory
  async chkSubcategory(id, pid, callback) {
    if (id == pid) {
      callback(id);
    } else {
      var sql = `SELECT * FROM category WHERE c_parent_id=${mysql.escape(id)}`;

      var subData = await new Promise((resolve, reject) => {
        conn.query(sql, (err, result) => {
          if (result.length > 0) {
            resolve(result);
          } else {
            resolve(null);
          }
        });
      });
      //  console.log(subData);
      if (subData != null) {
        for (var i of subData) {
          //console.log(i.id)
          await this.chkSubcategory(i.id, id, (rid) => {
            callback(rid);
          });
        }
      } else {
        // console.log(subData);
        this.chkSubcategory(id, id, (rid) => {
          callback(id);
        });
      }
    }
  }

  isInArray(value, array) {
    return array.indexOf(value) > -1;
  }

  webCouseDetailShow(id, callback) {
    try {
      if (!id) {
        var sql = `SELECT * FROM courses where published_status='active' AND approved_status='active' order by id desc`;

        conn.query(sql, async (err, results) => {
          if (err) {
            callback(true, err);
          } else {
            var data = [];
            for (var result of results) {
              var temp = {
                course_name: result.course_name,
                xapi_file_name: result.xapi_file_name?result.xapi_file_name:'',
                short_description: result.short_description,
                long_description: result.long_description,
                id: result.id,
                creator_id: result.user_id,
                image:
                  result.image != null
                    ? process.env.images_path + `${result.image}`
                    : "",
                avatar_image:
                  result.avatar_image != null
                    ? process.env.images_path + `${result.avatar_image}`
                    : "",
                attachment_file:
                  result.attachment_file != null
                    ? process.env.images_path + `${result.attachment_file}`
                    : "",
                course_level: result.course_level,
                group_id: result.group_id,
                group_details: [],
                category_id: result.category_id,
                sub_category_id: result.sub_category_id,
                course_tag: null,
                published_status: result.published_status,
                approved_status: result.approved_status,
                created_at: result.created_at,
                updated_at: result.updated_at,
                course_type: result.course_type,
                course_languages_id: result.course_languages_id,
              };

              data.push(temp);
            }
            callback(false, data);
          }
        });
      } else {
        var sql = `SELECT c.*,cl.id as course_languages_id FROM courses c LEFT JOIN course_languages cl ON cl.course_id=c.id WHERE c.published_status='active'  AND c.id=?`;

        conn.query(sql, id, async (err, result) => {
          if (err) {
            callback(true, err);
          } else {
            if (result.length > 0) {
              var data = {
                course_name: result[0].course_name,
                short_description: result[0].short_description,
                long_description: result[0].long_description,
                id: result[0].id,
                creator_id: result[0].user_id,
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
                    ? process.env.images_path + `${result[0].attachment_file}`
                    : "",
                course_level: result[0].course_level,
                group_id: result[0].group_id,
                group_details: [],
                category_id: result[0].category_id,
                sub_category_id: result[0].sub_category_id,
                course_tag: null,
                published_status: result[0].published_status,
                approved_status: result[0].approved_status,
                created_at: result[0].created_at,
                updated_at: result[0].updated_at,
                course_languages_id: result[0].course_languages_id,
                course_type: result[0].course_type,
                xapi_file_name:result[0].	xapi_file_name,
                xapi_attachment_file:
                  result[0].xapi_attachment_file != null
                    ? process.env.xapi_file_path +
                      `${result[0].xapi_attachment_file}`
                    : "",
                chapters: [],
              };

              // group details add
              var sql = `SELECT course_group.*,groups.g_name FROM course_group LEFT JOIN groups on groups.id=course_group.group_id WHERE course_group.course_id=${id}`;

              var groups = await new Promise((resolve, reject) => {
                conn.query(sql, (err, result) => {
                  if (err) throw err;
                  resolve(result);
                });
              });
              data.group_details = groups;

              // chapter details

              var sql2 = `SELECT * FROM (SELECT * FROM chapters WHERE course_id=${id})p  ORDER BY chapter_no ASC `;
              var chapter_data = await new Promise(function (resolve, reject) {
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
                        chapter_no: i.chapter_no,
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

              //  console.log(chapter_data)

              data.chapters = chapter_data;

              // lesson details
              // console.log(data.chapters)
              for (let chapter = 0; chapter < data.chapters.length; chapter++) {
                var sql2 = `SELECT * FROM (SELECT * FROM lessons WHERE course_id=${id} and chapter_id=${data.chapters[chapter].id})p ORDER BY lesson_no ASC `;
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
                          lesson_file: i.lesson_file
                            ? process.env.files_path + i.lesson_file
                            : "",
                          lesson_details: i.lesson_details,
                          created_at: i.created_at,
                          updated_at: i.updated_at,
                          lesson_vedio_type: i.lesson_vedio_type,
                          lesson_vedio_link: i.lesson_vedio_link
                            ? i.lesson_vedio_link
                            : "",
                          duration: i.duration ? i.duration : "",
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

              console.log(data);

              callback(false, data);
            } else {
              callback(true, result);
            }
          }
        });
      }
    } catch (err) {
      console.log(err);
    }
  }


  webCourseByName(name,callback)
  {
    var sql = `SELECT c.*,cl.id as course_languages_id FROM courses c LEFT JOIN course_languages cl ON cl.course_id=c.id WHERE c.published_status='active'  AND c.course_name=?`;

        conn.query(sql, name, async (err, result) => {
          if (err) {
            callback(true, err);
          } else {
            if (result.length > 0) {
              var data = {
                course_name: result[0].course_name,
                short_description: result[0].short_description,
                long_description: result[0].long_description,
                id: result[0].id,
                creator_id: result[0].user_id,
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
                    ? process.env.images_path + `${result[0].attachment_file}`
                    : "",
                course_level: result[0].course_level,
                group_id: result[0].group_id,
                group_details: [],
                category_id: result[0].category_id,
                sub_category_id: result[0].sub_category_id,
                course_tag: null,
                published_status: result[0].published_status,
                approved_status: result[0].approved_status,
                created_at: result[0].created_at,
                updated_at: result[0].updated_at,
                course_languages_id: result[0].course_languages_id,
                course_type: result[0].course_type,
                xapi_attachment_file:
                  result[0].xapi_attachment_file != null
                    ? process.env.xapi_file_path +
                      `${result[0].xapi_attachment_file}`
                    : "",
                chapters: [],
              };

              // group details add
              var sql = `SELECT course_group.*,groups.g_name FROM course_group LEFT JOIN groups on groups.id=course_group.group_id WHERE course_group.course_id=${result[0].id}`;

              var groups = await new Promise((resolve, reject) => {
                conn.query(sql, (err, result) => {
                  if (err) throw err;
                  resolve(result);
                });
              });
              data.group_details = groups;

              // chapter details

              var sql2 = `SELECT * FROM (SELECT * FROM chapters WHERE course_id=${result[0].id})p  ORDER BY chapter_no ASC `;
              var chapter_data = await new Promise(function (resolve, reject) {
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
                        chapter_no: i.chapter_no,
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

              //  console.log(chapter_data)

              data.chapters = chapter_data;

              // lesson details
              // console.log(data.chapters)
              for (let chapter = 0; chapter < data.chapters.length; chapter++) {
                var sql2 = `SELECT * FROM (SELECT * FROM lessons WHERE course_id=${result[0].id} and chapter_id=${data.chapters[chapter].id})p ORDER BY lesson_no ASC `;
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
                          lesson_file: i.lesson_file
                            ? process.env.files_path + i.lesson_file
                            : "",
                          lesson_details: i.lesson_details,
                          created_at: i.created_at,
                          updated_at: i.updated_at,
                          lesson_vedio_type: i.lesson_vedio_type,
                          lesson_vedio_link: i.lesson_vedio_link
                            ? i.lesson_vedio_link
                            : "",
                          duration: i.duration ? i.duration : "",
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

              console.log(data);

              callback(false, data);
            } else {
              callback(true, result);
            }
          }
        });
  }

  statusActiveInactive(data, callback) {
    var sql = `UPDATE courses SET approved_status=${mysql.escape(
      data.status
    )} WHERE id=${mysql.escape(data.id)}`;
    console.log(sql);
    conn.query(sql, (err, result) => {
      if (err) {
        callback(true, err);
      } else {
        callback(false, result);
      }
    });
  }

  async searchCourse(data, callback) {
    const { category_id, group_id, course_level, lang_id, search_text } = data;

    var listCate = await new Promise((resolve, reject) => [
      this.listOfCategory(category_id, (rid) => {
        resolve(rid);
      }),
    ]);

    console.log(listCate);

    var sql = `SELECT * FROM (SELECT courses.*,course_languages.language_id FROM courses LEFT JOIN course_languages ON course_languages.course_id=courses.id WHERE courses.approved_status='active')p  `;

    if (category_id || group_id || course_level || lang_id) {
      sql = sql + " WHERE ";

      if (category_id) {
        sql = sql + `  category_id IN (${mysql.escape(listCate)})  `;

        if (group_id) {
          sql = sql + ` AND group_id=${mysql.escape(group_id)} `;
        }

        if (course_level) {
          sql = sql + ` AND course_level=${mysql.escape(course_level)} `;
        }

        if (lang_id) {
          sql = sql + ` AND language_id=${mysql.escape(lang_id)}`;
        }
      } else if (group_id) {
        sql = sql + ` group_id=${mysql.escape(group_id)}`;

        if (course_level) {
          sql = sql + ` AND course_level=${mysql.escape(course_level)} `;
        }

        if (lang_id) {
          sql = sql + ` AND language_id=${mysql.escape(lang_id)}`;
        }
      } else if (course_level) {
        sql = sql + ` course_level=${mysql.escape(course_level)}`;

        if (lang_id) {
          sql = sql + ` AND language_id=${mysql.escape(lang_id)}`;
        }
      } else if (lang_id) {
        sql = sql + ` language_id=${mysql.escape(lang_id)}`;
      }
    }

    // no apply search text
    var nosearchSql = sql;

    if (search_text) {
      sql = ` SELECT * FROM (${sql})s WHERE course_name LIKE '%${search_text}%' OR long_description LIKE '%${search_text}%' `;
    }

    console.log("course search sql ", sql);

    conn.query(sql, async (err, result) => {
      if (err) throw err;

      if (result.length > 0) {
        var data = [];
        for (var item of result) {
          const sql2 = `SELECT c_name from category WHERE id=${item.category_id}`;
          const parentCatagoryName = await new Promise(function (
            resolve,
            reject
          ) {
            conn.query(sql2, (err2, result2) => {
              if (err2) throw err2;

              if (result2.length > 0) {
                resolve(result2);
              } else {
                resolve(null);
              }
            });
          });

          const sql3 = `SELECT firstname,lastname from users WHERE id=${mysql.escape(
            item.user_id
          )}`;
          const creators = await new Promise(function (resolve, reject) {
            conn.query(sql3, (err3, result3) => {
              if (err3) throw err3;

              if (result3.length > 0) {
                //console.log(result3
                var name = result3[0].firstname + " " + result3[0].lastname;
                resolve(name);
              } else {
                resolve(null);
              }
            });
          });

          var temp = {
            course_name: item.course_name,
            xapi_file_name: item.xapi_file_name?item.xapi_file_name:'',
            creator_name: creators,
            short_description: item.short_description,
            long_description: item.long_description,
            id: item.id,
            image:
              item.image != null
                ? process.env.images_path + `${item.image}`
                : "",
            avatar_image:
              item.avatar_image != null
                ? process.env.images_path + `${item.avatar_image}`
                : "",
            attachment_file:
              item.attachment_file != null
                ? process.env.images_path + `${item.attachment_file}`
                : "",
            course_level: item.course_level,
            group_id: item.group_id,
            group_details: [],
            category_id: item.category_id,
            total_enroll_no: 0,
            category_name:
              parentCatagoryName != null ? parentCatagoryName[0].c_name : null,
            sub_category_id: item.sub_category_id,
            course_tag: null,
            published_status: item.published_status,
            approved_status: item.approved_status,
            created_at: item.created_at,
            updated_at: item.updated_at,
            course_languages_id: item.course_languages_id,
            language_id: item.language_id,
          };

          // group details add
          var sql = `SELECT course_group.*,groups.g_name FROM course_group LEFT JOIN groups on groups.id=course_group.group_id WHERE course_group.course_id=${item.id}`;

          var groups = await new Promise((resolve, reject) => {
            conn.query(sql, (err, result) => {
              if (err) throw err;
              resolve(result);
            });
          });
          temp.group_details = groups;

          // total enroll no
          var sql = `SELECT COUNT(id) as no_enroll FROM enrollments where course_id=${item.id} AND user_enroll_status='active' `;

          var total_enroll_no = await new Promise((resolve, reject) => {
            conn.query(sql, (err, result) => {
              if (err) throw err;

              if (result.length > 0) {
                resolve(result[0].no_enroll);
              } else {
                resolve(0);
              }
            });
          });
          temp.total_enroll_no = total_enroll_no;

          data.push(temp);
        }

        callback(false, data);
      } else {
        var result2 = await new Promise((resolve, reject) => {
          conn.query(nosearchSql, async (err, result) => {
            var data = [];
            for (var item of result) {
              const sql2 = `SELECT c_name from category WHERE id=${item.category_id}`;
              const parentCatagoryName = await new Promise(function (
                resolve,
                reject
              ) {
                conn.query(sql2, (err2, result2) => {
                  if (err2) throw err2;

                  if (result2.length > 0) {
                    resolve(result2);
                  } else {
                    resolve(null);
                  }
                });
              });

              const sql3 = `SELECT firstname,lastname from users WHERE id=${mysql.escape(
                item.user_id
              )}`;
              const creators = await new Promise(function (resolve, reject) {
                conn.query(sql3, (err3, result3) => {
                  if (err3) throw err3;

                  if (result3.length > 0) {
                    //console.log(result3
                    var name = result3[0].firstname + " " + result3[0].lastname;
                    resolve(name);
                  } else {
                    resolve(null);
                  }
                });
              });

              var temp = {
                course_name: item.course_name,
                xapi_file_name: item.xapi_file_name?item.xapi_file_name:'',
                creator_name: creators,
                short_description: item.short_description,
                long_description: item.long_description,
                id: item.id,
                image:
                  item.image != null
                    ? process.env.images_path + `${item.image}`
                    : "",
                avatar_image:
                  item.avatar_image != null
                    ? process.env.images_path + `${item.avatar_image}`
                    : "",
                attachment_file:
                  item.attachment_file != null
                    ? process.env.images_path + `${item.attachment_file}`
                    : "",
                course_level: item.course_level,
                group_id: item.group_id,
                group_details: [],
                category_id: item.category_id,
                total_enroll_no: 0,
                category_name:
                  parentCatagoryName != null
                    ? parentCatagoryName[0].c_name
                    : null,
                sub_category_id: item.sub_category_id,
                course_tag: null,
                published_status: item.published_status,
                approved_status: item.approved_status,
                created_at: item.created_at,
                updated_at: item.updated_at,
                course_languages_id: item.course_languages_id,
                language_id: item.language_id,
              };

              // group details add
              var sql = `SELECT course_group.*,groups.g_name FROM course_group LEFT JOIN groups on groups.id=course_group.group_id WHERE course_group.course_id=${item.id}`;

              var groups = await new Promise((resolve, reject) => {
                conn.query(sql, (err, result) => {
                  if (err) throw err;
                  resolve(result);
                });
              });
              temp.group_details = groups;

              // total enroll no
              var sql = `SELECT COUNT(id) as no_enroll FROM enrollments where course_id=${item.id} AND user_enroll_status='active' `;

              var total_enroll_no = await new Promise((resolve, reject) => {
                conn.query(sql, (err, result) => {
                  if (err) throw err;

                  if (result.length > 0) {
                    resolve(result[0].no_enroll);
                  } else {
                    resolve(0);
                  }
                });
              });
              temp.total_enroll_no = total_enroll_no;

              data.push(temp);
            }

            resolve(data);
          });
        });

        callback(false, result2);
      }
    });
  }


  

}

module.exports = new Courses();
