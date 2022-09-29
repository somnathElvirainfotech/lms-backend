require('dotenv').config();
const api_url = process.env.api_url;
module.exports = {
    admin_api_url: api_url + "/admin",
    create_user: api_url + "/registration",
    get_all_user: api_url + "/users",
    update_user: api_url + "profile",
    language: api_url + "language",
    qualification: api_url + "qualification",
    category: api_url + "category",
    categoryParent: api_url + "parent-category",
    subCategory: api_url + "sub-category",
    praentSubCategory: api_url + 'parent-sub-category',
    group: api_url + "group",
    course: api_url + "course",
    courseApprove: api_url + 'course-approve',
    chapter: api_url + 'chapter',
    course_chapter: api_url + 'course-chapter',
    lesson: api_url + 'lesson',
    assignment: api_url + 'assignment',
    enrollment: api_url + 'enrollment',
    enrollment_search:api_url+'enrollment-search',
    maintenance:api_url+'maintenance'
}