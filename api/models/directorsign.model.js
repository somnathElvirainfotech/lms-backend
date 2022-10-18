const conn = require('../config/dbconfig');
const mysql = require('mysql');

class Directorsign {

    static create(data, callback) {
        var sql = `INSERT INTO certificate_sign_img SET created_at=NOW(), ? `;
        // console.log(sql)
        conn.query(sql, data, (err, result) => {
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
            var sql = `SELECT * FROM certificate_sign_img WHERE id=?`;
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
            var sql = `SELECT * FROM certificate_sign_img ORDER BY ID DESC`;
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

        if (data) {
            var sql = `UPDATE certificate_sign_img SET updated_at=NOW(), ? WHERE id=?`;

            conn.query(sql, [data, id], (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {
                    callback(false, result);
                }
            })
        } else {
            callback(true, err)
        }
    }

    static delete(id, callback) {
        var sql = `DELETE FROM certificate_sign_img WHERE id=?`;
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

module.exports = Directorsign;