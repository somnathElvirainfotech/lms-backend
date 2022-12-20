const TaskModel = require("../models/task.model");
const { statusMessages } = require("../helper/constant");
const e = require("connect-flash");
var fs = require("fs");
var path = require("path");
var AdmZip = require("adm-zip");
const taskModel = require("../models/task.model");

require("dotenv").config();

exports.create = async (req, res) => {
  const { created_by, task_start_date, task_end_date, course_id, task_name } =
    req.body;
  if (
    created_by &&
    task_start_date &&
    task_end_date &&
    course_id &&
    task_name
  ) {
    var group_arr = req.body.group_id ? req.body.group_id.split(",") : [];

    var data = {
      created_by: created_by,
      task_start_date: task_start_date,
      task_end_date: task_end_date,
      group_id: group_arr,
      task_describtion: req.body.task_describtion,
      task_name: task_name,
      course_id: course_id,
    };
    var file_name = null;

    console.log(data);

    if (req.files) {
      if (req.files.file_name) {
        // var fileName = Date.now() + '_' + Math.round(Math.random() * 1E9);
        // var dirname = 'lms_task_' + fileName;
        // fileName = 'lms_task_' + fileName + path.extname(req.files.file_name.name);
        // var newPath = path.join(process.cwd(), 'uploads/task_files', fileName)
        // req.files.file_name.mv(newPath);

        // // unzip
        // await decompress(`uploads/task_files/${fileName}`, `uploads/task_files/${dirname}`, {
        //     map: file => {
        //         file.path = file.path; //`unicorn-${file.path}`;
        //         return file;
        //     }
        // }).then(files => {
        //     console.log('unzip done!');
        // });

        // // delete
        // fs.unlink('uploads/task_files/' + fileName, (err) => {
        //     if (err) throw err;
        //     console.log("file delete!");
        // })

        // file_name = dirname + "/res/index.html";

        var newPath = path.join(
          process.cwd(),
          "uploads/task_files",
          req.files.file_name.name
        );
        var newFileName = req.files.file_name.name.split(".zip");
        var newDirPath = path.join(
          process.cwd(),
          "uploads/task_files",
          newFileName[0]
        );
        req.files.file_name.mv(newPath);

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
          fs.unlink("uploads/task_files/" + req.files.file_name.name, (err) => {
            if (err) throw err;
            console.log("file delete!");
          });
        }

        file_name = newFileName[0] + "/res/index.html";
      }
    }

    if (file_name) {
      data.file_name = file_name;
    } else {
      data.file_name = null;
    }

    TaskModel.create(data, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: "create not successfull",
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: "create successfull",
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

exports.getAll = (req, res) => {
  TaskModel.show(null, (err, result) => {
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

exports.getOne = async (req, res) => {
  const { id } = req.params;
  if (id) {
    TaskModel.show(id, (err, result) => {
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
      status: true,
      msg: "task id is required",
      data: [],
    });
  }
};

exports.update = async (req, res) => {
  const {
    task_start_date,
    task_end_date,
    course_id,
    id,
    task_status,
    task_name,
  } = req.body;

  console.log(req.body);

  if (task_start_date && task_end_date && course_id && id && task_status) {
    var group_arr = req.body.group_id ? req.body.group_id.split(",") : [];

    var data = {
      task_start_date: task_start_date,
      task_end_date: task_end_date,
      course_id: course_id,
      task_status: task_status,
      task_describtion: req.body.task_describtion,
      task_name: task_name,
    };
    var file_name = null;

    console.log(data);

    if (req.files) {
      if (req.files.file_name) {
        var newPath = path.join(
          process.cwd(),
          "uploads/task_files",
          req.files.file_name.name
        );
        var newFileName = req.files.file_name.name.split(".zip");
        var newDirPath = path.join(
          process.cwd(),
          "uploads/task_files",
          newFileName[0]
        );
        req.files.file_name.mv(newPath);

        console.log("jjjjjjjjj", newPath);

        // unzip
        var unzip_status = await new Promise((resolve, reject) => {
          try {
            Unzip(newPath, newDirPath);
            console.log("dddddddddd");
            resolve(true);
          } catch (err) {
            console.log(err);
            resolve(false);
          }
        });

        console.log(unzip_status);

        // delete

        if (unzip_status) {
          fs.unlink("uploads/task_files/" + req.files.file_name.name, (err) => {
            if (err) throw err;
            console.log("file delete!");
          });
        }

        file_name = newFileName[0] + "/res/index.html";

        console.log(file_name);

        if (file_name) {
          data.file_name = file_name;
        }
      }
    }

    //console.log("hhhhhhhhhhh",file_name);

    // if (file_name) {
    //     data.file_name = file_name;
    //     // console.log(data)

    //     // var oldfilename = await new Promise((resolve, reject) => {
    //     //     TaskModel.show(id, (err, result) => {
    //     //         // console.log(err)
    //     //         if (err) {
    //     //             resolve(null)
    //     //         } else {
    //     //             console.log(result)
    //     //             if (result.length > 0) {
    //     //                 resolve(result[0].file_name)
    //     //             } else {
    //     //                 resolve(null)
    //     //             }
    //     //         }
    //     //     })
    //     // })

    //     // console.log(oldfilename);

    //     // if (oldfilename != null) {
    //     //     var aaa = oldfilename.split("/");

    //     //     console.log('uploads/task_files/' + aaa[0])

    //     //     fs.rmdir('uploads/task_files/' + aaa[0], { recursive: true }, (err) => {
    //     //         if (err) throw err;
    //     //         console.log("file delete");
    //     //     })
    //     // }

    // }

    console.log("task updtae", data);

    TaskModel.update(data, id, group_arr, (err, result) => {
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
      msg: "task id is required",
      data: [],
    });
  }
};

exports.delete = async (req, res) => {
  const { id } = req.params;

  if (id) {
    var oldfilename = await new Promise((resolve, reject) => {
      TaskModel.show(id, (err, result) => {
        if (err) {
          resolve(null);
        } else {
          if (result.length > 0) {
            resolve(result[0].file_name);
          } else {
            resolve(null);
          }
        }
      });
    });

    TaskModel.delete(id, (err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: "not delete",
          data: [],
        });
      } else {
        if (oldfilename != null) {
          var aaa = oldfilename.split("/");

          fs.rmdir(
            "uploads/task_files/" + aaa[0],
            { recursive: true },
            (err) => {
              if (err) throw err;
              console.log("file delete");
            }
          );
        }

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

exports.taskSearch = (req, res) => {
  const { group_id, created_by, course_id } = req.body;

  var data = {
    group_id: group_id,
    created_by: created_by,
    course_id: course_id,
    user_id: req.body.user_id,
  };
  console.log(data);

  TaskModel.taskSearch(data, (err, result) => {
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

exports.taskResultDownload = (req, res) => {
  const { id } = req.params;

  if (id) {
    taskModel.taskResultDownload(id,(err, result) => {
      if (err) {
        res.status(200).json({
          status: false,
          msg: "no data found",
          data: [],
        });
      } else {
        res.status(200).json({
          status: true,
          msg: "record found",
          data: result,
        });
      }
    });
  } else {
    res.status(200).json({
      status: false,
      msg: "task id required",
      data: [],
    });
  }
};

function formatDate(date) {
  var d = new Date(date),
    month = "" + (d.getMonth() + 1),
    day = "" + d.getDate(),
    year = d.getFullYear();

  if (month.length < 2) month = "0" + month;
  if (day.length < 2) day = "0" + day;

  return [year, month, day].join("-");
}

var Unzip = async (filePath, dirname) => {
  try {
    // reading archives
    var zip = new AdmZip(filePath);
    console.log(filePath);
    zip.extractAllTo(/*target path*/ dirname, /*overwrite*/ true);

    // extracts the specified file to the specified location
    // zip.extractEntryTo(/*entry name*/ filePath, /*target path*/ dirname, /*maintainEntryPath*/ false, /*overwrite*/ true);

    // extracts everything
    // zip.extractAllTo(/*target path*/ dirname, /*overwrite*/ true);
  } catch (err) {
    console.log(err);
  }
};
