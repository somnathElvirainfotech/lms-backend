const e = require("connect-flash");
var mysql = require("mysql");
var conn = require("../config/dbconfig");
require("dotenv").config();

class qnsAnsModel {

  create(data, callback) {
    var sql = `INSERT INTO qns_ans_comment SET created_at=NOW(), ? `;

    conn.query(sql, data, (err, result) => {
      if (err) throw err;
      callback(false, null);
    });
  }

  update(data, id, callback) {
    var sql = `UPDATE qns_ans_comment SET updated_at=NOW(), ? WHERE id=? `;

    conn.query(sql, [data, id], (err, result) => {
      if (err) throw err;
      callback(false, null);
    });
  }


  async delete(id, callback) {

    // parent delte
    var sql = `DELETE FROM qns_ans_comment WHERE id=?`;

    await new Promise((resolve, reject) => {
      conn.query(sql, id, (err, result) => {
        if (err) throw err;
        resolve(true);
      });
    });


    // childs delete
    var sql = `DELETE FROM qns_ans_comment WHERE parent_id=?`;

    conn.query(sql, id, (err, result) => {
      if (err) throw err;
      callback(false, null);
    });
  }

  async show(data,callback)
  {
    var {course_id,id}=data;

    var sql="";

    var data=[];
    var total_comment=0;

    
    if(course_id && id){

        sql+=` SELECT *,(SELECT CONCAT_WS(" ",users.firstname,users.lastname) AS user_nane FROM users WHERE users.id=qns_ans_comment.user_id) AS user_name,(SELECT image FROM users WHERE users.id=qns_ans_comment.user_id ) AS user_image,(SELECT course_name FROM courses WHERE courses.id=qns_ans_comment.course_id ) AS course_name  FROM qns_ans_comment WHERE course_id=${mysql.escape(course_id)} AND parent_id=${mysql.escape(id)}  `;

        data=await new Promise((resolve,reject)=>{
            conn.query(sql,async(err,result)=>{
             if(err)throw err;

             if(result.length > 0)
             {
                var arr=[];

                for(var i of result)
                {

                    var qrr=`SELECT COUNT(id) AS total_replies FROM qns_ans_comment WHERE course_id=${mysql.escape(course_id)} AND parent_id=${mysql.escape(i.id)} `;

                    var total_replies=await new Promise((resolve,reject)=>{
                        conn.query(qrr,(err,result)=>{
                            if(err)throw err;

                            if(result.length>0)
                                resolve(result[0].total_replies)
                            else
                            resolve(0)
                        })
                    })

                    var  temp={
                        id:i.id,
                        course_id:i.course_id,
                        user_id:i.user_id,
                        comment:i.comment,
                        parent_id:i.parent_id,
                        user_name:i.user_name,
                        user_image:i.user_image != null?process.env.images_path+`${i.user_image}`:'',
                        total_replies:total_replies,
                        course_name:i.course_name,
                        created_at:i.created_at,
                        updated_at:i.updated_at,
                    }

                    arr.push(temp);
                }

                resolve(arr)

             }else{
                resolve([])
             }

            })
        })

    }
    else if(course_id)
    {
        sql+=` SELECT *,(SELECT CONCAT_WS(" ",users.firstname,users.lastname) AS user_nane FROM users WHERE users.id=qns_ans_comment.user_id) AS user_name,(SELECT image FROM users WHERE users.id=qns_ans_comment.user_id ) AS user_image,(SELECT course_name FROM courses WHERE courses.id=qns_ans_comment.course_id ) AS course_name  FROM qns_ans_comment WHERE course_id=${mysql.escape(course_id)} AND parent_id=0  `;

        data=await new Promise((resolve,reject)=>{
            conn.query(sql,async(err,result)=>{
             if(err)throw err;

             if(result.length > 0)
             {
                var arr=[];

                for(var i of result)
                {
                    var qrr=`SELECT COUNT(id) AS total_replies FROM qns_ans_comment WHERE course_id=${mysql.escape(course_id)} AND parent_id=${mysql.escape(i.id)} `;

                    var total_replies=await new Promise((resolve,reject)=>{
                        conn.query(qrr,(err,result)=>{
                            if(err)throw err;

                            if(result.length>0)
                                resolve(result[0].total_replies)
                            else
                            resolve(0)
                        })
                    })

                    var  temp={
                        id:i.id,
                        course_id:i.course_id,
                        user_id:i.user_id,
                        comment:i.comment,
                        parent_id:i.parent_id,
                        user_name:i.user_name,
                        user_image:i.user_image != null?process.env.images_path+`${i.user_image}`:'',
                        total_replies:total_replies,
                        course_name:i.course_name,
                        created_at:i.created_at,
                        updated_at:i.updated_at,
                    }

                    arr.push(temp);
                }

                resolve(arr)

             }else{
                resolve([])
             }

            })
        })

        var qrr=`SELECT COUNT(id) AS total_comment FROM qns_ans_comment WHERE course_id=${mysql.escape(course_id)} AND parent_id=0 `;

                total_comment=await new Promise((resolve,reject)=>{
                        conn.query(qrr,(err,result)=>{
                            if(err)throw err;
                          
                            if(result.length>0)
                                resolve(result[0].total_comment)
                            else
                            resolve(0)
                        })
                    })

                   
    }
    else if(id)
    {
        sql+=` SELECT * FROM qns_ans_comment WHERE id=${mysql.escape(id)}`;

        data=await new Promise((resolve,reject)=>{
            conn.query(sql,(err,result)=>{
             if(err)throw err;

             if(result.length > 0)
             {
                var arr=[];

                for(var i of result)
                {
                    var  temp={
                        id:i.id,
                        course_id:i.course_id,
                        user_id:i.user_id,
                        comment:i.comment,
                        parent_id:i.parent_id,
                        created_at:i.created_at,
                        updated_at:i.updated_at,
                    }

                    arr.push(temp);
                }

                resolve(arr)

             }else{
                resolve([])
             }

            })
        })
    }else{

        sql+=` SELECT *,(SELECT course_name FROM courses WHERE courses.id=qns_ans_comment.course_id ) AS course_name  FROM qns_ans_comment WHERE parent_id=0  group BY course_id `;

        data=await new Promise((resolve,reject)=>{
            conn.query(sql,async(err,result)=>{
             if(err)throw err;

             if(result.length > 0)
             {
                var arr=[];

                for(var i of result)
                {
                    var qrr=`SELECT COUNT(id) AS sub_total_comment FROM qns_ans_comment WHERE course_id=${mysql.escape(i.course_id)} AND parent_id=${mysql.escape(i.id)} `;

                    var sub_total_comment=await new Promise((resolve,reject)=>{
                        conn.query(qrr,(err,result)=>{
                            if(err)throw err;

                            if(result.length>0)
                                resolve(result[0].sub_total_comment)
                            else
                            resolve(0)
                        })
                    })

                    var  temp={
                        id:i.id,
                        course_id:i.course_id,
                        user_id:i.user_id,
                        comment:i.comment,
                        parent_id:i.parent_id,
                        total_comment:sub_total_comment,
                        course_name:i.course_name,
                        created_at:i.created_at,
                        updated_at:i.updated_at,
                    }

                    arr.push(temp);
                }

                resolve(arr)

             }else{
                resolve([])
             }

            })
        })


    }


    if(data.length>0)
    {
        callback(false,{data:data,total_comment:total_comment})
    }else{
        callback(true,null)
    }



  }


}

module.exports = new qnsAnsModel();
