const e = require('connect-flash');
const XapiService = require('../helper/Service');

exports.xapiRead = async (req, res) => {

    var { course_type, course_name, user_email } = req.body;

    console.log(req.body);
    // xapi course answer and question ------------------------

    if (course_type == "xapi" && course_name && user_email) {

        var tarr = course_name.split("xapi_");
        course_name = tarr[1]

        var agent = user_email
        var activity = "";
        var verb = "";

        var data = {
            agent: '{"mbox": "mailto:' + agent + '"}',
            activity: activity,
            verb: "",//`http://adlnet.gov/expapi/verbs/${verb}`
        }

        // ------ xapi course total user enroll
        //var totalCourse = ["practice1", "practice2"];

        var xapiCourse = []

        var responceAll = await XapiService.getXapiStatements(data);

        // get all xapi course id  ----------------
        var xapiCourseIdArr = [];
        for (var course of responceAll.data.statements) {

            var xapiCourseId = course.context.contextActivities.grouping[0].id;
            if (!xapiCourseIdArr.includes(xapiCourseId)) {
                xapiCourseIdArr.push(xapiCourseId)
            }
        }
        //   -----------------------------------

        //console.log(totalCourse);

        console.log(data);

        // --------------------------------------------
        for (var item of xapiCourseIdArr) {

            var arr = item.split("/");

            if (arr.includes(course_name)) {

                var aa = {
                    course_name: course_name,
                    xapi_course_id: item,
                }

                xapiCourse.push(aa);
            }

        }
        // --------------------------------------------

        var tempArr = [];


        var xdata = {
            agent: '{"mbox": "mailto:' + agent + '"}',
            verb: `http://adlnet.gov/expapi/verbs/answered`
        }


        var xresponce = await XapiService.getXapiStatements(xdata);


        // ----- -----------------------------
        for (var item of xapiCourse) {

            var count = 0;


            if (xresponce.data.statements.length > 0) {


                for (var singleRes of xresponce.data.statements) {

                    if (item.xapi_course_id == singleRes.context.contextActivities.grouping[0].id) {

                        var qusAns = {
                            result: {},
                            questionAns: {}
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
                finalArr.push(i)
                tempChk.push(i.questionAns.id)
            }

        }


        res.status(200).json({
            status: true,
            msg: " record  found ",
            data: finalArr,
        });





    } else {
        res.status(200).json({
            status: false,
            msg: " record not found ",
            data: [],
        });
    }



    //end xapi -----------------------------------------------
}