const conn = require('../config/dbconfig');
const mysql = require('mysql');
const e = require('connect-flash');

require('dotenv').config();

class Groups {

    create(data, callback) {

        const sql = `INSERT INTO groups(g_name,g_status,created_at) VALUES
        (${mysql.escape(data.g_name)},'active',NOW())`;

        //console.log(sql)

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
            var sql = `SELECT * FROM groups ORDER BY id DESC`;

            conn.query(sql, async (err, result) => {

                if (err) {
                    callback(true, err)
                }
                else {
                    callback(false, result)
                }

            })

        }
        else {
            var sql = `SELECT * FROM groups where id=${mysql.escape(id)}`;

            conn.query(sql, (err, result) => {

                if (err) {
                    callback(true, err)
                }
                else {
                    callback(false, result)
                }

            })
        }
    }

    update(data, id, callback) {
        var sql = `UPDATE groups SET updated_at=NOW(),? WHERE id=?`;

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
        var sql = `DELETE FROM groups WHERE id=?`;

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



}

module.exports = new Groups();


