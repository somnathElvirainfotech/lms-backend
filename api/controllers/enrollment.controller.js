const enrollmentModel = require('../models/enrollment.model');
const { statusMessages } = require('../helper/constant');


exports.create = (req, res) => {
    const { user_id, course_id } = req.body;
    if (course_id && user_id) {
        enrollmentModel.create(req.body, (err, result) => {
            if (err) {
                if (result == null) {
                    res.status(200).json({
                        status: true,
                        msg: "Allready Enrolled",
                        data: []
                    })
                } else {
                    res.status(200).json({
                        status: false,
                        msg: "create not successfull",
                        data: []
                    })
                }
            }
            else {
                res.status(200).json({
                    status: true,
                    msg: "create successfull",
                    data: []
                })
            }
        })
    }
    else {
        res.status(200).json({
            status: false,
            msg: statusMessages.allFieldRequired,
            data: []
        })
    }
}


exports.getAllUser = (req, res) => {

    const { cid, fromdate, todate, user_email, std_no } = req.body;

    enrollmentModel.show(cid, fromdate, todate, user_email, std_no, (err, result) => {
        if (err) {
            res.status(200).json({
                status: false,
                msg: statusMessages.dataNotFound,
                data: []
            })
        }
        else {
            res.status(200).json({
                status: true,
                msg: statusMessages.dataFound,
                data: result
            })
        }
    })
}

exports.getUser = (req, res) => {
    const { id } = req.params;
    if (id) {
        enrollmentModel.show(id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: statusMessages.dataNotFound,
                    data: []
                })
            }
            else {
                res.status(200).json({
                    status: true,
                    msg: statusMessages.dataFound,
                    data: result
                })
            }
        })
    }
    else {
        res.status(200).json({
            status: true,
            msg: "id is required",
            data: []
        })
    }
}

exports.update = (req, res) => {
    const { id, user_id, course_id, enrollment_status } = req.body;



    if (id && user_id && course_id && enrollment_status) {

        const data = {
            user_id: user_id,
            course_id: course_id,
            enrollment_status: enrollment_status
        }

        enrollmentModel.update(data, id, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: statusMessages.notUpdate,
                    data: []
                })
            }
            else {
                res.status(200).json({
                    status: true,
                    msg: statusMessages.update,
                    data: []
                })
            }
        })
    }
    else {
        res.status(200).json({
            status: false,
            msg: "id is required",
            data: []
        })
    }
}


exports.showByCouseOruserId = (req, res) => {
    const { user_id, course_id } = req.body;
    if (user_id || course_id) {
        let data = {
            user_id: user_id,
            course_id: course_id
        }
        enrollmentModel.showBYCourseOrUser(data, (err, result) => {
            if (err) {
                res.status(200).json({
                    status: false,
                    msg: statusMessages.dataNotFound,
                    data: []
                })
            }
            else {
                res.status(200).json({
                    status: true,
                    msg: statusMessages.dataFound,
                    data: result
                })
            }
        })

    }
    else {
        res.status(200).json({
            status: false,
            msg: statusMessages.allFieldRequired,
            data: []
        })
    }
}

exports.getAllEnrollmentUserList = (req, res) => {
    const { id } = req.params;
    enrollmentModel.getAllEnrollmentUserList(id, (err, result) => {
        if (err) {
            res.status(200).json({
                status: false,
                msg: statusMessages.dataNotFound,
                data: []
            })
        }
        else {

            var arr = [];

            for (var i of result) {
                if (id == i.creator_id) {
                    arr.push(i)
                }
            }


            res.status(200).json({
                status: true,
                msg: statusMessages.dataFound,
                data: arr
            })
        }
    })
}


exports.enrollmentStatusUpdate = (req, res) => {
    // const { id, course_progress, enrollment_status } = req.body;

    // const data = {
    //     course_progress: course_progress,
    //     enrollment_status: enrollment_status
    // }

    // for(var i of req.body)
    // {

    // }

   // log(req.body)

    enrollmentModel.statusUpdate(req.body, (err, result) => {
        if (err) {
            res.status(200).json({
                status: false,
                msg: statusMessages.notUpdate,
                data: []
            })
        }
        else {
            res.status(200).json({
                status: true,
                msg: statusMessages.update,
                data: []
            })
        }
    })
}





// exports.delete = (req, res) => {
//     const { id } = req.params;
//     if(id)
//     {
//         enrollmentModel.delete(id, (err, result) => {
//             if (err) {
//                 res.status(200).json({
//                     status: false,
//                     msg: "not delete",
//                     data: []
//                 })
//             }
//             else {
//                 res.status(200).json({
//                     status: true,
//                     msg: "delete successfull",
//                     data: []
//                 })
//             }
//         })
//     }
//     else{
//         res.status(200).json({
//             status:false,
//             msg:statusMessages.requiredId,
//             data:[]
//         })
//     }
// }
