const mysql = require("mysql");
var conn = require("../config/dbconfig");
const express = require("express");
const path = require("path");

// Import dependencies
const fs = require("fs");
const moment = require("moment");
const PDFDocument = require("pdfkit");
const DirectorsignModel = require("../models/directorsign.model");
const LogoModel = require("../models/logo.model");


// image for certificate background -----------
var cer1 = path.join(__dirname, "./certificates/cer1.jpeg");
var cer2 = path.join(__dirname, "./certificates/cer2.jpeg");
var cer3 = path.join(__dirname, "./certificates/cer3.jpeg");
var cfontbold = path.join(__dirname,"./certificates/fonts/Roboto-Black.ttf");
var cfontlight=path.join(__dirname,"./certificates/fonts/Roboto-Light.ttf");
var cfontmedium=path.join(__dirname,"./certificates/fonts/Roboto-Medium.ttf");
var defaultImg = path.join(__dirname, "./certificates/certificate.png");
var downloadPath = path.join(__dirname, "../../uploads/userCertificate");

var signPath = path.join(__dirname, "../../uploads/signature");
var LogoPath = path.join(__dirname, "../../uploads/logo");

exports.createCertificate = async (req, res) => {
  var {
    user_name,
    firstname,
    lastname,
    cert_course_name,
    date,
    enroll_id,
    certificate_id,
    email
  } = req.body;

  if (
    user_name &&
    firstname &&
    lastname &&
    email &&
    cert_course_name &&
    date &&
    enroll_id &&
    certificate_id != 0
  ) {
    var sql = `SELECT * FROM enrollments WHERE id=${mysql.escape(
      enroll_id
    )} AND enrollment_status="completed" `;

    var certificateName = await new Promise((resolve, reject) => {
      conn.query(sql, (error, result) => {
        if (error) throw error;

        if (result.length > 0) {
          if (result[0].certificate_name != null)
            resolve(result[0].certificate_name);
          else resolve(null);
        } else {
          resolve("false");
        }
      });
    });

    // get signature -----------------------------------------
    var signatureName = await new Promise((resolve, reject) => {
      DirectorsignModel.show(null, (error, result) => {
        if (error) {
          resolve("");
        } else {
          resolve(result[0].signature_name);
        }
      });
    });

    signatureName = signPath + "/" + signatureName;
    // end signature -----------------------------------------

    // get logo -----------------------------------------
    var logoPath = await new Promise((resolve, reject) => {
      LogoModel.show(null, (error, result) => {
        if (error) {
          resolve("");
        } else {
          resolve(result[0].logo_name);
        }
      });
    });

    logoPath = LogoPath + "/" + logoPath;
    console.log(logoPath);
    // end logo -----------------------------------------

    // console.log(signatureName);

    if (certificateName != null) {
        res.status(200).json({
            status: true,
            msg: "certificate receive successfully",
            data: [{ certificate: process.env.user_certificate_path+certificateName }],
          });
    } else {
      // ----------

      // console.log(path.join(__dirname, "certificates/certificate.png"),"fdsdfsdfdfdf");
      var backgroudImage = defaultImg;
      if (certificate_id == 1) {
        backgroudImage = cer1;
      } else if (certificate_id == 2) {
        backgroudImage = cer2;
      } else if (certificate_id == 3) {
        backgroudImage = cer3;
      }

      // The certificate data
      const username = user_name;
      const courseName = cert_course_name;

      var newCertificateName=`${cert_course_name}-${Date.now()}.pdf`;

      //   end -----------------------

      //   ---------------------------------------------------- certificate 1 -----------------------------------
      if (certificate_id == 1) {
        // Create the PDF document
        const doc = new PDFDocument({
          layout: "landscape",
          size: "A4",
        });

        // Pipe the PDF into an name.pdf file
        
        doc.pipe(fs.createWriteStream(`${downloadPath}/${newCertificateName}`));

        // Draw the certificate image
        doc.image(backgroudImage, 0, 0, { width: 842 });

        // logo image
        doc.image(logoPath,290, 50, {
          width: 300,
          align:"center",
          valign: 'center' 
         })

        // Set the font style
        doc.font(cfontbold)

         // Draw the date
         doc.fontSize(17).text(moment(date).format("DD/MM/YYYY"), 350, 501, {
            align: "center",
          }).fillColor("black");


        // Set the font style
        doc.font(cfontbold).fillColor("#5c5b59");


         // Draw the course name -------------------
         doc.fontSize(40).text(courseName.toUpperCase(), 100, 250, {
            align: "center",
          });

        // Draw the user name -------------------
         doc.fontSize(20).text(username.toUpperCase(), 100, 400, {
            align: "center",
          });


        // signature image
        doc.image(signatureName, 200, 500, {
             width: 90,
             align:"center",
             valign: 'center' 
            });

        

       

       


        // Finalize the PDF and end the stream
        doc.end();
      }
      //  ------------------------------------------------------- end --------------------------------------------


      //   ---------------------------------------------------- certificate 2 -----------------------------------
     else if (certificate_id == 2) {
        // Create the PDF document
        const doc = new PDFDocument({
          layout: "landscape",
          size: "A4",
        });

        // Pipe the PDF into an name.pdf file
        doc.pipe(fs.createWriteStream(`${downloadPath}/${newCertificateName}`));

        // Draw the certificate image
        doc.image(backgroudImage, 0, 0, { width: 842,height:590 });

        // logo image
        doc.image(logoPath,280, 70, {
          width: 300,
          align:"center",
          valign: 'center' 
         })

        // Set the font style
        doc.font(cfontmedium)

         // Draw the date
         doc.fontSize(17).text(moment(date).format("DD/MM/YYYY"), 425, 480, {
            align: "center",
          }).fillColor("black");


        // Set the font style
        doc.font(cfontmedium).fillColor("#b68d44");


         // Draw the course name -------------------
         doc.fontSize(30).text(courseName.toUpperCase(), 60, 200, {
            align: "center",
          });

        // Draw the user name -------------------
         doc.fontSize(40).text(username.toUpperCase(), 70, 350, {
            align: "center",
          });


        // signature image
        doc.image(signatureName, 205, 480, {
             width: 90,
             align:"center",
             valign: 'center' 
            });

        

       

       


        // Finalize the PDF and end the stream
        doc.end();
      }
      //  ------------------------------------------------------- end --------------------------------------------


      //   ---------------------------------------------------- certificate 3 -----------------------------------
     else if (certificate_id == 3) {
        // Create the PDF document
        const doc = new PDFDocument({
          layout: "landscape",
          size: "A4",
        });

        // Pipe the PDF into an name.pdf file
        doc.pipe(fs.createWriteStream(`${downloadPath}/${newCertificateName}`));

        // Draw the certificate image
        doc.image(backgroudImage, 0, 0, { width: 842,height:595 });

        // logo image
        doc.image(logoPath,100, 40, {
          width: 250,
          align:"center",
          valign: 'center' 
         })

        // Set the font style
        doc.font(cfontmedium)

         // Draw the date
         doc.fontSize(17).text(moment(date).format("DD/MM/YYYY"), -90, 460, {
            align: "center",
          }).fillColor("black");


        // Set the font style
        doc.font(cfontmedium).fillColor("#2c4b2e");


         // Draw the course name -------------------
         doc.fontSize(40).text(courseName.toUpperCase(), -300, 200, {
            align: "center",
          });

        // Draw the user name -------------------
         doc.fontSize(40).text(firstname.toUpperCase(), -300, 330, {
            align: "center",
          });

          doc.fontSize(40).text(lastname.toUpperCase(), -300, 370, {
            align: "center",
          });


        // signature image
        doc.image(signatureName, 70, 460, {
             width: 90,
             align:"center",
             valign: 'center' 
            });

        

       

       


        // Finalize the PDF and end the stream
        doc.end();
      }
      //  ------------------------------------------------------- end --------------------------------------------


      var sql = `UPDATE enrollments SET certificate_name=${mysql.escape(newCertificateName)} WHERE id=${mysql.escape(enroll_id)} `;
  
       await new Promise((resolve, reject) => {
        conn.query(sql, (error, result) => {
          if (error) throw error;
          resolve(true)
        });
      });


      res.status(200).json({
        status: true,
        msg: "certificate create successfully",
        data: [{ certificate: process.env.user_certificate_path+newCertificateName }],
      });
    }
  } else {
    res.status(200).json({
      status: false,
      msg: "required all username,date, certificate course name,enroll id,email",
      data: [],
    });
  }
};
