const conn = require('../config/dbconfig');
const mysql = require('mysql');


class User {

    static create(data, callback) {
        try {
            const { role, email, password, status } = data;

            let sql = `INSERT INTO users(role, email,password, is_active, created_at) VALUES (${mysql.escape(role)},${mysql.escape(email)},${mysql.escape(password)},${mysql.escape(status)},NOW())`;
            // console.log(sql)
            conn.query(sql, (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {
                    callback(false, result)
                }
            })
        } catch (err) {
            callback(true, err)
        }
    }

    // check unique user or get single user value
    static getUser(data, callback) {
        try {
            const { column, value } = data;
            const sql = `SELECT * FROM users WHERE ${column}=${mysql.escape(value)}`;

            conn.query(sql, (err, result) => {
                if (err) {
                    callback(true, err)
                }
                else {
                    callback(false, result)
                }
            });
        } catch (err) {
            callback(true, err)
        }
    }


    static loginInsert(data, callback) {
        try {
            const { userId, clientIp } = data;

            let sql = `INSERT INTO login(user_id,last_signin_date,last_signin_ip,created_at) VALUES (${mysql.escape(userId)},NOW(),${mysql.escape(clientIp)},NOW())`;
console.log(sql)
            conn.query(sql, (error, result) => {
                if (error) {
                    callback(true, error);
                }
                else {
                    callback(false, result)
                }
            })

        } catch (err) {
            callback(true, err)
        }
    }


}

module.exports = User;