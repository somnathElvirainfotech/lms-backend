const conn = require('../config/dbconfig');
const mysql = require('mysql');
const e = require('connect-flash');

require('dotenv').config();

class Category {

    create(data, callback) {
        //console.log(data.c_parent_id)
        var parentId = data.c_parent_id? data.c_parent_id : 0;
        const sql = `INSERT INTO category(c_name,c_description,c_image,c_parent_id,c_status,created_at) VALUES
        (${mysql.escape(data.c_name)},${mysql.escape(data.c_description)},${mysql.escape(data.c_image)},
        ${mysql.escape(parentId)},${mysql.escape(data.c_status)},NOW())`;

        console.log(sql)

        conn.query(sql, (err, result) => {
            if (err) {
                callback(true, err)
            }
            else {
                callback(false, result)
            }
        })
    }

    show(id, callback) {
        if (!id) {
            var sql = `SELECT * FROM category ORDER BY id DESC`;

            conn.query(sql, async (err, result) => {

                if (err) {
                    callback(true, err)
                }
                else {

                    var tempArr=[];
                    

                    for(var item of result)
                    {
                        // console.log(item)

                        const sql2=`SELECT c_name from category WHERE id=${item.c_parent_id}`;
                        const parentCatagoryName=await new Promise(function(resolve,reject){
                            conn.query(sql2,(err2,result2)=>{
                                if (err2) throw err2;
                               
                                if(result2.length>0){
                                     resolve(result2);
                                 }else{
                                        resolve(null);
                                     }
                                 
                            })
                        })

                       // var {c_name}=parentCatagoryName;
                      
                        
                        var temp={
                            id:item.id,
                            c_name:item.c_name,
                            c_description:item.c_description,
                            c_status:item.c_status,
                            parent_cName:parentCatagoryName!=null?parentCatagoryName[0].c_name:null             
                         }

                        tempArr.push(temp)
                    }


                    //console.log(temp)


                    callback(false, tempArr)
                }

            })

        }
        else {
            var sql = `SELECT * FROM category where id=${mysql.escape(id)}`;

            conn.query(sql, (err, result) => {

                if (err) {
                    callback(true, err)
                }
                else {
                    var tempArr = [];
                    result.forEach(item => {
                        tempArr.push({
                            id: item.id,
                            c_name: item.c_name,
                            c_description: item.c_description,
                            c_image: item.c_image ? process.env.images_path + item.c_image : '',
                            c_parent_id: item.c_parent_id,
                            c_status: item.c_status,
                            created_at: item.created_at,
                            updated_at: item.updated_at
                        })
                    })


                    callback(false, tempArr)
                }

            })
        }
    }

    update(data, id, callback) {
        var sql = `UPDATE category SET updated_at=NOW(),? WHERE id=?`;

        conn.query(sql, [data, id], (err, result) => {
            if (err) {
                console.log(err)
                callback(true, err)
            }
            else {
                callback(false, result)
            }
        })
    }

    delete(id, callback) {
        var sql = `DELETE FROM category WHERE id=?`;

        conn.query(sql, id, (err, result) => {
            if (err) {
                ///console.log(err)
                callback(true, err)
            }
            else {
                callback(false, result)
            }
        })
    }


    get_parentCatagory(callback) {
        var sql = `SELECT id,c_name FROM category WHERE c_parent_id='0'`;

        conn.query(sql, (err, result) => {
            if (err) {
                // console.log(err)
                callback(true, err)
            }
            else {
                callback(false, result)
            }
        })
    }


    get_parent_sub_category(callback){
        var sql=`SELECT * FROM category`;

        conn.query(sql,async(err,result)=>{
            if(err)
            {
                callback(true,err)
            }
            else{

                var arr=[];
                for(var item of result)
                {
                    if(item.c_parent_id=='0')
                    {
                        //console.log(item.c_parent_id)
                        var temp={
                            id:item.id,
                            c_name:item.c_name,
                            c_description:item.c_description,
                            c_parent_id:item.c_parent_id,
                            c_status:item.c_status,
                            sub_category:[]
                        }

                        arr.push(temp);

                    }else{

                        for(var tempArr of arr )
                        {
                            if(tempArr.id==item.c_parent_id)
                            {
                                item.sub_category=[];
                                tempArr.sub_category.push(item);
                            
                            }else{

                                for(var i of tempArr.sub_category)
                                {
                                    if(i.id==item.c_parent_id)
                                    {
                                        i.sub_category.push(item)
                                    }
                                }
                            }
                        }
                       
                    }
                }
               //console.log(arr)
                callback(false,arr)
                
            }
        })
    }


    get_subCategory(pid,callback){
        
        if(pid)
        {
            var sql=`SELECT * from category WHERE c_parent_id=${mysql.escape(pid)}`;

        conn.query(sql,(err,result)=>{
            if(err)
            {
                callback(true,err)
            }
            else{
                callback(false,result)
            }
        })

        }else{
            
            var sql=`SELECT * from category WHERE c_parent_id !=0`;

            conn.query(sql,(err,result)=>{
            if(err)
            {
                callback(true,err)
            }
            else{
                callback(false,result)
            }
        })
        }
    }

    
}

module.exports = new Category();



// "SELECT * FROM `categories` ORDER BY categories.c_id DESC";
   
//         dbcon.db.query(categoryQuery,async(err,result)=>{
//         if (err) {
//           return res.status(500).send(err);
//         }
//         let finalarr=[];
//         if(result.length>0){
//         for(cat of result){
         
//           if(cat.parent_id == 0){
           
           
//           var subcatname="Primary Category"
//             finalarr.push({'c_id':cat.c_id,'category_name':cat.category_name,'cat_image':cat.cat_image,'category_status':cat.category_status,'subcat_name': subcatname});
           
//           }else{
//             var c_id= cat.c_id;
//             var category_name = cat.category_name;
//             var cat_image = cat.cat_image;
//             var category_status =cat.category_status;
//             var getsql="SELECT category_name FROM `categories` WHERE c_id="+cat.parent_id;
//             const w_name = await new Promise(function (resolve, reject) {
//             dbcon.db.query(getsql,(err,single)=>{
//               if(err) throw err;
  
             
//               if(single.length>0){
//                 resolve(single);
//               }else{
//                 resolve(null);
//               }
//             });
//           });
//           console.log(w_name[0].category_name,"subcat detail");
//               finalarr.push({'c_id':c_id,'category_name':category_name,'cat_image':cat_image,'category_status':category_status,'subcat_name': w_name[0].category_name});
   
            
//           }
         
//         }
//       }
//        // console.log(finalarr);
//         res.render("admin/manage-category-update.ejs", {
//           title: "Manage Category",
//           type: "allview",
//           page: "category",
//           result: finalarr,
//           sessionvalue: sess,
//         });
//       });