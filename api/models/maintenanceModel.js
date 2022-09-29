const conn = require('../config/dbconfig');
const mysql = require('mysql');
const e = require('connect-flash');

require('dotenv').config();

class Maintenance {



    async create(data, id, callback) {

        // delete all row 
        var sql = `SELECT * FROM maintenance`;
        var chk = await new Promise((resolve, reject) => {
            conn.query(sql, (err, result) => {
                if (err) throw err;

                if (result.length > 0)
                    resolve(result[0]);
                else
                    resolve(null)
            })
        })
        //-----------------------

        if (chk == null) {
            var sql = `INSERT INTO maintenance SET created_at=NOW(), ? `;

            //console.log(sql)

            conn.query(sql, data, (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {
                    callback(false, result)
                }
            })
        } else {
            var sql = `UPDATE maintenance SET updated_at=NOW(), ? WHERE id=? `;

            //console.log(sql)

            conn.query(sql, [data, id], (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {
                    callback(false, result)
                }
            })
        }
    }

    show(callback) {
        var sql = `SELECT * FROM maintenance`;

        conn.query(sql, (err, result) => {
            if (err) throw err;

            if (result.length > 0) {
                callback(false, result)
            } else {
                callback(true, "No Maintenance Rule set");
            }
        })
    }



}

module.exports = new Maintenance();


