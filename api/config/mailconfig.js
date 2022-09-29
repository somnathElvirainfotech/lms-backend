const nodemailer = require('nodemailer');

// send mail setup ---------------------------------------------------------------------------------
var transporter = nodemailer.createTransport({
    service: "smtp.gmail.com",
    host: "mail.elvirainfotech.org",
    port: 465,
    secure: true,
    auth: {
        user: "noreply@elvirainfotech.org",
        pass: "Seb4YCTQc9w5",
    },
});

module.exports = transporter;