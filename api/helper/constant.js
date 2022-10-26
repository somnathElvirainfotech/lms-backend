module.exports = {
    apiRoutes: {
        test: "/test",

        adminLogin: "/admin/login",
        adminRegistration: '/admin/registration',
        userCsv: '/admin/usercsv',

        course_certificate_count: '/course/certificate/count/:id',

        allUser: '/users',
        status: "/users/status",
        getUser: "/users/:id",
        usersByRole: "/users/role/:id",
        userSearch: "/user/search",
        generatePassword: "/user/password/generate",

        userRegistration: '/registration',
        userLogin: '/login',
        cretorLogin: '/creator-login',
        forgetPassword: '/forgetpassword',


        profile: '/profile',
        userPasswordChange: '/password-change',
        updatePassword: '/update-password',

        imageUpload: '/user-image',

        language: '/language',
        languageId: '/language/:id',

        task: '/task',
        taskId: '/task/:id',
        taskSearch: '/task/search',

        assignment: '/assignment',
        assignmentId: '/assignment/:id',
        assignmentGetByCourseId: '/assignment-course',
        assignmentByUserid: '/assignment-user/:id',
        assignmentByCreatorId: '/assignment-creator/:id',

        enrollment: '/enrollment',
        enrollmentId: '/enrollment/:id',
        enrollmentBycuId: '/enrollment-user-course',
        enrollmentBySearch: '/enrollment-search',
        enrollmentUserList: '/enrollmentlist/:id',

        chapter: '/chapter',
        chapterId: '/chapter/:id',
        chapterWithCourseId: '/course-chapter/:id',
        chapterByCreator: '/userchapter/:id',

        lessons: '/lesson',
        lessonsId: '/lesson/:id',
        userLesson: '/userlesson/:id',
        lessonSearch: "/lesson/search",

        qualification: '/qualification',
        qualificationId: '/qualification/:id',

        course: '/course',
        courseId: '/course/:id',
        categoryWiseCourse: '/category-wise-course/:id',
        courseApproveStatus: '/course-approve',
        webCourse: '/web-course',
        webCourseId: '/web-course/:id',
        webCourseName: '/web-course-name/:name',
        showByCreatorId: '/course-show-user/:id',

        courseSearch: '/course/search',
        chapterSearch: "/chapter/search",

        category: '/category',
        categoryId: '/category/:id',
        parent_category: '/parent-category',
        sub_category: '/sub-category',
        sub_category_pid: '/sub-category/:pid',
        sub_category_2: '/subcategory',
        parent_sub_category: '/parent-sub-category',

        group: '/group',
        groupId: '/group/:id',

        commentRating: '/comment/rating',
        commentRatingId: '/comment/rating/course',
        commentStatus: '/comment/status',

        commentRatingTask: '/task/comment/rating',
        commentRatingTaskID: '/task/comment/rating/:id',
        commentRatingIdTask: '/task/comment/rating/course',
        commentStatusTask: '/task/comment/status',

        activitySearch: "/activity/search",

        regularCoureseTrack: "/regular/course/track",
        getTrackingLession: "/regular/course/lesson",
        getCurrentLesson: '/regular/course/current/lesson',

        userTask: "/user/task",

        maintenance: '/maintenance',

        certificate: "/certificate",
        certificateId: "/certificate/:id",


    },
    statusMessages: {
        login: "Login Successfull",
        loginFaield: "Invalid Email & Password ",
        loginCheck: "Email & Password Required",
        userNoActive: "User not active",
        thisUserNotLogIn: "User not login here",
        userActive: "User active",
        registrationCheck: "All fields are required",
        error: "Something Went Wrong",
        dataFound: "Data found",
        dataNotFound: 'Data not found',
        allReadyExits: " all ready Exits",
        allFieldRequired: "all fields required",
        passwordNotMatch: "Password not match",
        userCreate: "user create successfully",
        userNotCreate: "User not craete successfully",
        statusUpdate: "Status Update successfully",
        update: "Update successfully",
        notUpdate: "Update not successfully",
        requiredId: "Id is required",

    },
}