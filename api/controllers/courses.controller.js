const courseModule = require("../models/courses.model");
const { statusMessages } = require("../helper/constant");
const path = require("path");

var fs = require("fs");
var AdmZip = require("adm-zip");

const { unzip } = require("zlib");
const { resolve } = require("path");

exports.create = async (req, res) => {
  const {
    course_name,
    course_type,
    short_description,
    long_description,
    category_id,
    lang,
    published_status,
    certificate_id,
  } = req.body;
  console.log(req.body);
  // console.log(req.body)
  // console.log(req.files)
  var image = null;
  var avatar_image = null;
  var attachment_file = null;
  var xapi_attachment_file = null;
  var sample_link=null;
  if (
    course_name &&
    short_description &&
    long_description &&
    category_id &&
    lang &&
    published_status 
  ) {
    //console.log(req.body)
    if (req.files) {
      if (req.files.image) {
        var fileName = Date.now() + "_" + req.files.image.name;
        var newPath = path.join(process.cwd(), "uploads/images", fileName);
        req.files.image.mv(newPath);
        image = fileName;
      }

      if (req.files.avatar_image) {
        var fileName2 = Date.now() + "_" + req.files.avatar_image.name;
        var newPath2 = path.join(process.cwd(), "uploads/images", fileName2);
        req.files.avatar_image.mv(newPath2);
        avatar_image = fileName2;
      }

      if (req.files.attachment_file) {
        var fileName3 = Date.now() + "_" + req.files.attachment_file.name;
        var newPath3 = path.join(process.cwd(), "uploads/images", fileName3);
        req.files.attachment_file.mv(newPath3);
        attachment_file = fileName3;
      }

      // if(req.files.sample_vedio && req.body.sample_type=="sample_vedio")
      // {
      //   var fileName3 = Date.now() + "_" + req.files.sample_link.name;
      //   var newPath3 = path.join(process.cwd(), "uploads/vedios", fileName3);
      //   req.files.sample_link.mv(newPath3);
      //   sample_link = fileName3;
      // }

      if (req.files.xapi_attachment_file) {
        // console.log(req.files.xapi_attachment_file);
        //var fileName = Date.now() + '_' + Math.round(Math.random() * 1E9);
        // var dirname = 'lms_course_' + fileName;
        //fileName = 'lms_course_' + fileName + path.extname(req.files.xapi_attachment_file.name);
        //var newPath = path.join(process.cwd(), 'uploads/task_files', fileName)

        var newPath = path.join(
          process.cwd(),
          "uploads/task_files",
          req.files.xapi_attachment_file.name
        );
        var newFileName = req.files.xapi_attachment_file.name.split(".zip");
        var newDirPath = path.join(
          process.cwd(),
          "uploads/task_files",
          newFileName[0]
        );
        req.files.xapi_attachment_file.mv(newPath);

        // unzip
        var unzip_status = await new Promise((resolve, reject) => {
          try {
            Unzip(newPath, newDirPath);
            resolve(true);
          } catch (err) {
            console.log(err);
            resolve(false);
          }
        });

        //console.log(fileName);

        // delete
        if (unzip_status) {
          fs.unlink(
            "uploads/task_files/" + req.files.xapi_attachment_file.name,
            (err) => {
              if (err) throw err;
              console.log("file delete!");
            }
          );
        }

        xapi_attachment_file = newFileName[0] + "/res/index.html";
      }
    } else {
      image = req.body.image;
      avatar_image = req.body.avatar_image;
      attachment_file = req.body.attachment_file;
      xapi_attachment_file = req.body.xapi_attachment_file;
    }

    console.log("user group", req.body.group_id );
    var group_arr = req.body.group_id ? req.body.group_id.split(",") : [];

    const data = {
      user_id: req.body.user_id,
      course_name: req.body.course_name,
      user_id: req.body.user_id,
      sub_category_id: req.body.sub_category_id
        ? req.body.sub_category_id
        : null,
      short_description: req.body.short_description,
      long_description: req.body.long_description,
      image: image,
      avatar_image: avatar_image,
      attachment_file: attachment_file,
      xapi_attachment_file: xapi_attachment_file,
      group_id: group_arr,
      category_id: req.body.category_id,
      course_level: req.body.course_level,
      course_tag: req.body.course_tag,
      published_status: req.body.published_status,
      lang: req.body.lang,
      course_type: req.body.course_type,
      certificate_id: certificate_id,
      xapi_file_name: req.body.xapi_file_name ? req.body.xapi_file_name : null,
      course_certificate_name:req.body.course_certificate_name,
      author_email:req.body.author_email,
      author_name:req.body.author_name,
      // sample_type:req.body.sample_type
    };

    // if(req.body.sample_type=="sample_link")
    // {
    //     if(req.files.sample_link)
    //     data.sample_link=req.files.sample_link;
    // }

    console.log("course ... ", data);

    if(req.body.course_type=="xapi")
    {
    var chk_xapi_name = await new Promise((resolve, reject) => {
      courseModule.chkXapiFileName(
        {
          xapi_file_name: req.body.xapi_file_name
            ? req.body.xapi_file_name
            : null,
        },
        (chk) => {
          resolve(chk);
        }
      );
    });
  }

    if (chk_xapi_name && req.body.course_type=="xapi") {
        res.status(200).json({
            status: false,
            msg: "Xapi name allready exists",
            data: [],
          });
    } else {
      courseModule.create(data, (err, result) => {
        if (err) {
          // console.log(result)
          res.status(200).json({
            status: false,
            msg: "Course not create",
            data: [],
          });
        } else {
          res.status(200).json({
            status: true,
            msg: "Course create sucessfull",
            data: [],
          });
        }
      });
    }
  } else {
    res.status(200).json({
      status: false,
      msg: statusMessages.allFieldRequired,
      data: [],
    });
  }
};

exports.update = async (req, res) => {
  const {
    course_name,
    short_description,
    category_id,
    lang,
    id,
    certificate_id,
  } = req.body;
  // console.log("ggggg    ")
  // console.log(req.body)
  // console.log(req.files)
  var image = "";
  var avatar_image = "";
  var attachment_file = "";
  var xapi_attachment_file = "";

  if (id) {
    // console.log(req.body)

    if (req.files) {
      if (req.files.image) {
        var fileName = Date.now() + "_" + req.files.image.name;
        var newPath = path.join(process.cwd(), "uploads/images", fileName);
        req.files.image.mv(newPath);
        image = fileName;
      }

      if (req.files.avatar_image) {
        var fileName2 = Date.now() + "_" + req.files.avatar_image.name;
        var newPath2 = path.join(process.cwd(), "uploads/images", fileName2);
        req.files.avatar_image.mv(newPath2);
        avatar_image = fileName2;
      }

      if (req.files.attachment_file) {
        var fileName3 = Date.now() + "_" + req.files.attachment_file.name;
        var newPath3 = path.join(process.cwd(), "uploads/images", fileName3);
        req.files.attachment_file.mv(newPath3);
        attachment_file = fileName3;
      }
      if (req.files.xapi_attachment_file) {
        // var fileName = Date.now() + '_' + Math.round(Math.random() * 1E9);
        // var dirname = 'lms_course_' + fileName;
        // fileName = 'lms_course_' + fileName + path.extname(req.files.xapi_attachment_file.name);
        // var newPath = path.join(process.cwd(), 'uploads/task_files', fileName)
        // req.files.xapi_attachment_file.mv(newPath);

        var newPath = path.join(
          process.cwd(),
          "uploads/task_files",
          req.files.xapi_attachment_file.name
        );
        var newFileName = req.files.xapi_attachment_file.name.split(".zip");
        var newDirPath = path.join(
          process.cwd(),
          "uploads/task_files",
          newFileName[0]
        );
        req.files.xapi_attachment_file.mv(newPath);

        // unzip
        var unzip_status = await new Promise((resolve, reject) => {
          try {
            Unzip(newPath, newDirPath);
            resolve(true);
          } catch (err) {
            console.log(err);
            resolve(false);
          }
        });

        console.log("status", unzip_status);

        //console.log(fileName);

        // delete
        if (unzip_status) {
          fs.unlink(
            "uploads/task_files/" + req.files.xapi_attachment_file.name,
            (err) => {
              if (err) throw err;
              console.log("file delete!");
            }
          );
        }

        xapi_attachment_file = newFileName[0] + "/res/index.html";
      }
    } else {
      image = req.body.image;
      avatar_image = req.body.avatar_image;
      attachment_file = req.body.attachment_file;
      xapi_attachment_file = req.body.xapi_attachment_file;
    }

    var group_arr = req.body.group_id ? req.body.group_id.split(",") : [];

    const data = {
      course_name: req.body.course_name,
      short_description: req.body.short_description,
      long_description: req.body.long_description,
      category_id: req.body.category_id,
      sub_category_id: req.body.sub_category_id
        ? req.body.sub_category_id
        : null,
      course_level: req.body.course_level,
      course_tag: req.body.course_tag,
      published_status: req.body.published_status,
      course_type: req.body.course_type,
      certificate_id: certificate_id,
      course_certificate_name:req.body.course_certificate_name,
      author_email:req.body.author_email,
      author_name:req.body.author_name
    };

    if (req.body.user_id) {
      data.user_id = req.body.user_id;
    }

    if (req.body.xapi_file_name) {
      data.xapi_file_name = req.body.xapi_file_name;
    }

    // console.log(data)

    if (image) {
      data.image = image;
    }

    if (avatar_image) {
      data.avatar_image = avatar_image;
    }

    if (attachment_file) {
      data.attachment_file = attachment_file;
    }

    if (xapi_attachment_file) {
      data.xapi_attachment_file = xapi_attachment_file;
    }

    console.log(data);

    courseModule.update(data, id, group_arr, req.body.lang, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: "Course not update",
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: "Course update sucessfull",
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

exports.findAll = (req, res) => {
  courseModule.show(null, (err, result) => {
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

exports.findOne = (req, res) => {

  var {id}=req.params;

  if (id) {

    

    courseModule.show(id, (err, result) => {
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



exports.delete = (req, res) => {
  if (req.params.id) {
    courseModule.delete(req.params.id, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: result != null ? result : "delete not done",
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: result != null ? result : "delete successfull",
          data: [],
        });
      }
    });
  }
};

exports.categorywiseCourse = (req, res) => {
  const { id } = req.params;
  if (id) {
    courseModule.categoryWiseShow(id, (err, result) => {
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
  }
};

// approve status
exports.statusActiveInactive = (req, res) => {
  const { status, id } = req.body;

  const data = {
    status: status == "active" ? "active" : "inactive",
    id: id,
  };

  if (status && id) {
    courseModule.statusActiveInactive(data, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: "approve status not change",
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: "approve status change",
          data: [],
        });
      }
    });
  }
};

exports.webCourseDEtailsShowId = (req, res) => {  
  const { id } = req.params;

  if (id) {

    console.log("value type of ",typeof(id))

    courseModule.webCouseDetailShow(id, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: statusMessages.dataNotFound,
          data: [],
        });
      } else {


        var lastChapterIndex=(result.chapters.length-1);
        var lastChapterId=(result.chapters[lastChapterIndex].id);

        for(var i=0;i<result.chapters.length;i++)
        {
          var lastLessonIndex=(result.chapters[i].lessons.length-1);
          var lastLessonId=(result.chapters[i].lessons[lastLessonIndex].id)

          for(var j=0;j<result.chapters[i].lessons.length;j++)
          {
            if(result.chapters[i].lessons[j].id != lastLessonId)
            {
              result.chapters[i].lessons[j].next_lessons_data={
                chapter_id:result.chapters[i].id,
                chapter_name:result.chapters[i].chapter_name,
                lesson_id:result.chapters[i].lessons[j+1].id,
                lesson_vedio_link:result.chapters[i].lessons[j].lesson_vedio_link,
                lesson_vedio_type:result.chapters[i].lessons[j].lesson_vedio_type,
                lesson_name:result.chapters[i].lessons[j].lesson_name,
                lesson_details:result.chapters[i].lessons[j].lesson_details,
              }
            }
            else if(result.chapters[i].lessons[j].id == lastLessonId && result.chapters[i].id==lastChapterId)
            {
              result.chapters[i].lessons[j].next_lessons_data={
                chapter_id:null,
                chapter_name:null,
                lesson_id:null,
                lesson_vedio_link:null,
                lesson_vedio_type:null,
                lesson_name:null,
                lesson_details:null,
              }

            }else if(result.chapters[i].lessons[j].id == lastLessonId)
            {
              result.chapters[i].lessons[j].next_lessons_data={
                chapter_id:result.chapters[i+1].id,
                chapter_name:result.chapters[i+1].chapter_name,
                lesson_id:result.chapters[i+1].lessons[0].id,
                lesson_vedio_link:result.chapters[i+1].lessons[0].lesson_vedio_link,
                lesson_vedio_type:result.chapters[i+1].lessons[0].lesson_vedio_type,
                lesson_name:result.chapters[i+1].lessons[0].lesson_name,
                lesson_details:result.chapters[i+1].lessons[0].lesson_details,
              }
            }



          }
        }


        res.status(200).json({
          status: true,
          msg: statusMessages.dataFound,
          data: result,
        });
        
      }
    });
  }
};


exports.webCourseByName = (req, res) => {  
  const { name } = req.params;

  if (name) {

    courseModule.webCourseByName(name, (err, result) => {
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
  }
};

exports.webCourseDEtailsShow = (req, res) => {
  courseModule.webCouseDetailShow(null, (err, result) => {
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

exports.showByCreatorId = (req, res) => {
  const { id } = req.params;

  if (id) {
    courseModule.showByCreatorId(id, (err, result) => {
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

exports.searchCourse = (req, res) => {
  const { category_id, group_id, course_level, lang_id, search_text } =
    req.body;

  var data = {
    category_id: category_id,
    group_id: group_id,
    course_level: course_level,
    lang_id: lang_id,
    search_text: search_text,
    user_id:req.body.user_id?req.body.user_id:'',
  };

  courseModule.searchCourse(data, (err, result) => {
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

var Unzip = async (filePath, dirname) => {
  try {
    // reading archives
    console.log(filePath);
    var zip = new AdmZip(filePath);

    // extracts the specified file to the specified location
    // zip.extractEntryTo(/*entry name*/ filePath, /*target path*/ dirname, /*maintainEntryPath*/ false, /*overwrite*/ true);

    // extracts everything
    zip.extractAllTo(/*target path*/ dirname, /*overwrite*/ true);
  } catch (err) {
    console.log(err);
  }
};
