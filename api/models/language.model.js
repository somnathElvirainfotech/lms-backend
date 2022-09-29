const conn = require('../config/dbconfig');
const mysql = require('mysql');

class Language {

    static create(data, callback) {
        var sql = `INSERT INTO languages(name, created_at) VALUES (${mysql.escape(data.name)},NOW())`;
        // console.log(sql)
        conn.query(sql, (err, result) => {
            if (err) {
                callback(true, err)
            }
            else {
                callback(false, result);
            }
        })
    }

    static show(id, callback) {
        if (id) {
            var sql = `SELECT * FROM languages WHERE id=?`;
            conn.query(sql, id, (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {
                    callback(false, result);
                }
            })
        }
        else {
            var sql = `SELECT * FROM languages ORDER BY ID DESC`;
            conn.query(sql, (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {
                    callback(false, result);
                }
            })
        }
    }

    static update(data, id, callback) {
        var sql = `UPDATE languages SET updated_at=NOW(), ? WHERE id=?`;

        conn.query(sql, [data, id], (err, result) => {
            if (err) {
                callback(true, err)
            }
            else {
                callback(false, result);
            }
        })
    }

    static delete(id, callback) {
        var sql = `DELETE FROM languages WHERE id=?`;
        conn.query(sql, id, (err, result) => {
            if (err) {
                callback(true, err)
            }
            else {
                callback(false, result);
            }
        })
    }
}

module.exports = Language;