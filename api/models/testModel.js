const conn = require('../config/dbconfig');

class Test {
   static read(data,callback) {
        try{

            let sql="SELECT * FROM test";

            conn.query(sql,(err,result)=>{
                if(err) throw err;
                callback(result)
            })

        }catch(err)
        {
            console.log(err)
        }
    }
}

module.exports=Test;