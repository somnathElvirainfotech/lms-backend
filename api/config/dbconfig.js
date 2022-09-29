const mysql = require('mysql');
require("dotenv").config();



// database setup --------------------------------------------------------------------------------
const conn = mysql.createConnection({
    host: process.env.db_host,
    user: process.env.db_user,
    password: process.env.db_password,
    database: process.env.db_name
    // multipleStatements:true
});

conn.connect((err) => {
    if (err) throw err;
    console.log('Connected to database');
});







module.exports = conn;
