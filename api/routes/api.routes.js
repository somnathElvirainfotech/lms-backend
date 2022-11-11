const router = require('express').Router();
const { apiRoutes } = require('../helper/constant');
const checkUserAuth = require('../middlewares/auth');



const adminController = require('../controllers/admin.controller');
const userController = require('../controllers/user.controller');
const languageController = require('../controllers/language.controller');
const qualificationController = require('../controllers/qualification.controller');
const courseController = require('../controllers/courses.controller');
const categoryController = require('../controllers/category.controller');
const groupsController = require('../controllers/groups.controller');
const chapterController = require('../controllers/chapter.controller');
const lessonsController = require('../controllers/lesson.controller');
const assignmentController = require('../controllers/assignment.controller');
const enrollmentController = require('../controllers/enrollment.controller');
const commentRating = require('../controllers/ratingCommnet.controller');
const taskContoller = require('../controllers/task.controller');
const activityController = require('../controllers/activeController');
const courseTrackController = require('../controllers/courseTrackController');
const userTaskController = require("../controllers/userTask.controller");
const maintenanceController = require("../controllers/maintenanceController");
const xapiQuestionAns = require('../controllers/xapi.controllers');
const certificateController = require('../controllers/certificate.controller');
const qnsAnsController=require('../controllers/qnsAnsController');
const directorsign=require("../controllers/directorSign.controller")


// admin user
router.post(apiRoutes.adminLogin, adminController.login);
router.post(apiRoutes.adminRegistration, adminController.registration)



// user
router.post(apiRoutes.userLogin, userController.login)
router.post(apiRoutes.forgetPassword, userController.forgetPassword)
router.post(apiRoutes.userRegistration, checkUserAuth, userController.registration)
router.get(apiRoutes.allUser, checkUserAuth, userController.getALlUser);
router.post(apiRoutes.status, checkUserAuth, userController.statusActiveInactive);
router.post(apiRoutes.userSearch, checkUserAuth, userController.userSearch);
router.post(apiRoutes.generatePassword, checkUserAuth, userController.generatePassword);
router.post("/login-type", userController.getUserByEmail)
router.post("/login-status", userController.loginStatus);


// get user by role id
router.get(apiRoutes.usersByRole, checkUserAuth, userController.getUserByRoleId);

// course,certificate count
router.get(apiRoutes.course_certificate_count, checkUserAuth, userController.countCourseCertificate);

//creator login
router.post(apiRoutes.cretorLogin, userController.creatorLogin);

// csv user
router.post(apiRoutes.userCsv, checkUserAuth, adminController.userCsv);

// get single user by email
router.post(apiRoutes.profile, checkUserAuth, userController.getUserProfile);

// get single user id
router.get(apiRoutes.getUser, checkUserAuth, userController.getUser);

// updtae user by email
router.put(apiRoutes.profile, checkUserAuth, userController.updateUser);

// updtae user by id
router.put(apiRoutes.allUser, checkUserAuth, userController.updateUserById);

router.post(apiRoutes.userPasswordChange, checkUserAuth, userController.changePassord);
router.post(apiRoutes.updatePassword, checkUserAuth, userController.onlyChangePassword);
router.post(apiRoutes.imageUpload, checkUserAuth, userController.imageUpload);


// language
router.get(apiRoutes.language, languageController.getAllUser);
router.get(apiRoutes.languageId, languageController.getUser);
router.post(apiRoutes.language, languageController.create);
router.put(apiRoutes.language, languageController.update);
router.delete(apiRoutes.languageId, languageController.delete);


// qualification
router.get(apiRoutes.qualification, checkUserAuth, qualificationController.getAllUser);
router.get(apiRoutes.qualificationId, checkUserAuth, qualificationController.getUser);
router.post(apiRoutes.qualification, checkUserAuth, qualificationController.create);
router.put(apiRoutes.qualification, checkUserAuth, qualificationController.update);
router.delete(apiRoutes.qualificationId, checkUserAuth, qualificationController.delete);


// course
router.post(apiRoutes.course, courseController.create);
router.get(apiRoutes.course, courseController.findAll);
router.get(apiRoutes.courseId, courseController.findOne);
router.put(apiRoutes.course, courseController.update);
router.delete(apiRoutes.courseId, courseController.delete);
router.get(apiRoutes.categoryWiseCourse, courseController.categorywiseCourse);
router.post(apiRoutes.courseApproveStatus, courseController.statusActiveInactive);
router.get(apiRoutes.showByCreatorId, courseController.showByCreatorId);

// course filter
router.post(apiRoutes.courseSearch, courseController.searchCourse);

// web course shhow details and single course
router.get(apiRoutes.webCourse, courseController.webCourseDEtailsShow);
router.get(apiRoutes.webCourseId, courseController.webCourseDEtailsShowId); 
router.get(apiRoutes.webCourseName, courseController.webCourseByName); 


// category
router.post(apiRoutes.category, categoryController.create);
router.get(apiRoutes.category, categoryController.findAll);
router.get(apiRoutes.categoryId, categoryController.findByID);
router.put(apiRoutes.category, categoryController.update);
router.delete(apiRoutes.categoryId, categoryController.delete);
router.get(apiRoutes.parent_category, categoryController.get_parent_catagory);
router.get(apiRoutes.sub_category, categoryController.get_sub_category);
router.get(apiRoutes.sub_category_pid, categoryController.get_sub_category);
router.get(apiRoutes.parent_sub_category, categoryController.get_parent_sub_category);

// groups
router.get(apiRoutes.group, groupsController.getAllUser);
router.get(apiRoutes.groupId, groupsController.getUser);
router.post(apiRoutes.group, groupsController.create);
router.put(apiRoutes.group, groupsController.update);
router.delete(apiRoutes.groupId, groupsController.delete);

// chapters
router.get(apiRoutes.chapter, checkUserAuth, chapterController.getAllUser);
router.get(apiRoutes.chapterId, checkUserAuth, chapterController.getUser);
router.post(apiRoutes.chapter, checkUserAuth, chapterController.create);
router.put(apiRoutes.chapter, checkUserAuth, chapterController.update);
router.delete(apiRoutes.chapterId, checkUserAuth, chapterController.delete);
router.get(apiRoutes.chapterWithCourseId, checkUserAuth, chapterController.showWithCourse);
router.get(apiRoutes.chapterByCreator, checkUserAuth, chapterController.chapterShowByCreatorId);
router.post(apiRoutes.chapterSearch, checkUserAuth, chapterController.chapterSearch);


// lessons
router.get(apiRoutes.lessons, checkUserAuth, lessonsController.getAllUser);
router.get(apiRoutes.lessonsId, checkUserAuth, lessonsController.getUser);
router.post(apiRoutes.lessons, checkUserAuth, lessonsController.create);
router.put(apiRoutes.lessons, checkUserAuth, lessonsController.update);
router.delete(apiRoutes.lessonsId, checkUserAuth, lessonsController.delete);
router.get(apiRoutes.userLesson, checkUserAuth, lessonsController.getLessonByCreatorId);
router.post(apiRoutes.lessonSearch, checkUserAuth, lessonsController.lessonSearch);

// assignments
router.get(apiRoutes.assignment, checkUserAuth, assignmentController.getAllUser);
router.get(apiRoutes.assignmentId, checkUserAuth, assignmentController.getUser);
router.post(apiRoutes.assignment, checkUserAuth, assignmentController.create);
router.put(apiRoutes.assignment, checkUserAuth, assignmentController.update);
router.delete(apiRoutes.assignmentId, checkUserAuth, assignmentController.delete);
router.post(apiRoutes.assignmentGetByCourseId, assignmentController.getByCourseId);
router.get(apiRoutes.assignmentByUserid, checkUserAuth, assignmentController.getAllEnrollAssignmentByUserId)

// assignment by cretor id
router.get(apiRoutes.assignmentByCreatorId, checkUserAuth, assignmentController.getAssignByCretorId);

// enrollment
router.post(apiRoutes.enrollment, checkUserAuth, enrollmentController.create);
router.post(apiRoutes.enrollmentBySearch, checkUserAuth, enrollmentController.getAllUser);
router.post(apiRoutes.enrollmentBycuId, checkUserAuth, enrollmentController.showByCouseOruserId);

router.get(apiRoutes.enrollmentUserList, checkUserAuth, enrollmentController.getAllEnrollmentUserList);

//enrollment update
router.put(apiRoutes.enrollment, checkUserAuth, enrollmentController.enrollmentStatusUpdate);




// rating comment course
router.post(apiRoutes.commentRating, commentRating.create);
router.post(apiRoutes.commentRatingId, commentRating.getByCourseId);
router.get(apiRoutes.commentRating, commentRating.getAll);
router.post(apiRoutes.commentStatus, commentRating.chkComment);


// rating comment task
router.post(apiRoutes.commentRatingTask, commentRating.createTask);
router.post(apiRoutes.commentRatingIdTask, commentRating.getByTaskId);
router.get(apiRoutes.commentRatingTask, commentRating.getAllTask);
router.post(apiRoutes.commentStatusTask, commentRating.chkCommentTask);
router.delete(apiRoutes.commentRatingTaskID, commentRating.delete);
router.put(apiRoutes.commentRatingTask, commentRating.update);

// task
router.get(apiRoutes.task, taskContoller.getAll);
router.get(apiRoutes.taskId, taskContoller.getOne);
router.post(apiRoutes.task, taskContoller.create);
router.put(apiRoutes.task, taskContoller.update);
router.delete(apiRoutes.taskId, taskContoller.delete);
router.post(apiRoutes.taskSearch, taskContoller.taskSearch);


//activity
router.post(apiRoutes.activitySearch, activityController.Search);

// course track
router.post(apiRoutes.regularCoureseTrack, checkUserAuth, courseTrackController.regularCourseTrack);
router.post(apiRoutes.getTrackingLession, checkUserAuth, courseTrackController.getTrackingDetails);
router.post(apiRoutes.getCurrentLesson, checkUserAuth, courseTrackController.getCurrentLession);
router.post('/last-lesson-update', checkUserAuth, courseTrackController.updateCurrentLesson);



// user task
router.post(apiRoutes.userTask, checkUserAuth, userTaskController.insertUpdate);


// maintenance
router.get(apiRoutes.maintenance, maintenanceController.getAll)
router.post(apiRoutes.maintenance, checkUserAuth, maintenanceController.create)


// xapi qus and ans read by course id and user email
router.post("/xapi/question-answer", xapiQuestionAns.xapiRead);
router.post("/xapi/result-save", xapiQuestionAns.resultSave);
router.post("/xapi/store-result", xapiQuestionAns.storeResult);


// certificate
router.get(apiRoutes.certificate, checkUserAuth, certificateController.getAllUser);
router.get(apiRoutes.certificateId, checkUserAuth, certificateController.getUser);
router.post(apiRoutes.certificate, checkUserAuth, certificateController.create);
router.put(apiRoutes.certificate, checkUserAuth, certificateController.update);
router.delete(apiRoutes.certificateId, checkUserAuth, certificateController.delete);

// signature
router.get("/signature", checkUserAuth, directorsign.getAllUser);
router.get("/signature/:id", checkUserAuth, directorsign.getUser);
router.post("/signature", checkUserAuth, directorsign.create);
router.put("/signature", checkUserAuth, directorsign.update);
router.delete("/signature/:id", checkUserAuth, directorsign.delete);

// anstion and answer comment
router.post("/qns-ans-comment", qnsAnsController.create);
router.post("/qns-ans-comment-search", qnsAnsController.show);
router.put("/qns-ans-comment/:id", qnsAnsController.update);
router.delete("/qns-ans-comment/:id", qnsAnsController.delete);


module.exports = router;