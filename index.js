require('dotenv').config();
const express = require('express');
const app = express();
const bodyParser = require("body-parser");
const cors = require('cors');
const session = require('express-session');
const cookieParser = require('cookie-parser');
const fileUpload = require("express-fileupload");
const path = require("path");
const flash = require('connect-flash');
const toastr = require('express-toastr');
const category = require('./admin/controllers/category.controller');
const groupController = require('./admin/controllers/group.controller');
const courseController = require('./admin/controllers/course.controller');
const maintenanceController = require('./admin/controllers/maintenance.controller');
const resultController=require("./admin/controllers/result.controller.js")
const loginAuth = require('./admin/middlewares/loginAuth');
// const formData = require('express-form-data');

// app.use(formData.parse());


const multer = require('multer');
const { changeUser } = require('./api/config/dbconfig');
const upload = multer({ dest: 'uploads/' })

const corsOptions = {
  origin: '*',
  credentials: true,
  optionSuccessStatus: 200,
}

// set views file path
app.set("views", __dirname + "/admin/views");
// craete path for css js
app.use("/admin-property", express.static(path.join(__dirname, "admin/views/public")));
app.use("/images", express.static(path.join(__dirname, "uploads/images")));
app.use("/files", express.static(path.join(__dirname, "uploads/files")));
app.use("/vedios", express.static(path.join(__dirname, "uploads/vedios")));
app.use("/xapi", express.static(path.join(__dirname, "uploads/task_files")));
app.use("/certificate", express.static(path.join(__dirname, "uploads/certificate")));
app.use("/signature", express.static(path.join(__dirname, "uploads/signature")));
app.use("/logo", express.static(path.join(__dirname, "uploads/logo")));
app.use("/course/certificate", express.static(path.join(__dirname, "uploads/userCertificate")));

app.set("view engine", "ejs");
app.engine("html", require("ejs").renderFile);

app.use(cors(corsOptions));
app.use(cookieParser('secret'));
app.use(session({ secret: 'secret', saveUninitialized: true, resave: true }));
app.use(cors(corsOptions))
app.use(fileUpload(
  {
    useTempFiles: true,
    tempFileDir: path.join(__dirname, "uploads/")
  }
));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(flash());
app.use(toastr());




// router
app.get('/', (req, res) => {
  res.redirect("/admin/login")
});

// api routes
app.use('/api', require('./api/routes/api.routes.js'));

// web routes
require("./admin/routes/admin.routes")(app);
require("./admin/routes/createuser.routes")(app);
require("./admin/routes/language.routes")(app);
require("./admin/routes/qualification.routes")(app);
require("./admin/routes/userSetting.routes")(app);
require("./admin/routes/chapter.routes")(app);
require("./admin/routes/lesson.routes")(app);
require("./admin/routes/assignment.routes")(app);
require("./admin/routes/enrollment.routes")(app)
// require("./admin/routes/category.routes")(app);

// category web url
app.get('/category/create', loginAuth, category.create);
app.post('/category/create', loginAuth, category.postCreate);
app.get('/category', loginAuth, category.show);
app.get('/category/edit/:id', loginAuth, category.edit);
app.post('/category/edit', loginAuth, category.postEdit);
app.get('/category/del/:id', loginAuth, category.delete);

// group web url
app.get('/group/create', loginAuth, groupController.create);
app.post('/group/create', loginAuth, groupController.postCreate);
app.get('/group', loginAuth, groupController.getAll);
app.get('/group/edit/:id', loginAuth, groupController.edit);
app.post('/group/edit', loginAuth, groupController.postEdit);
app.get('/group/del/:id', loginAuth, groupController.delete);


// course web url
app.get('/course/create', loginAuth, courseController.create);
app.post('/course/create', loginAuth, courseController.postCreate);
app.get('/course', loginAuth, courseController.getAll);
app.get('/course/edit/:id', loginAuth, courseController.edit);
app.post('/course/edit', loginAuth, courseController.postEdit);
app.get('/course/del/:id', loginAuth, courseController.delete);
app.post('/course/approve/status', loginAuth, courseController.approveStatus);

//maintenance mode
app.get('/maintenance', loginAuth, maintenanceController.getAll);
app.post('/maintenance', loginAuth, maintenanceController.create);

// result ------------------------
app.get('/result',loginAuth,resultController.result)

 





// 404 routes
app.get("*", (req, res) => {
  res.status(404).send("page not found")
})



// set port, listen for requests
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});


