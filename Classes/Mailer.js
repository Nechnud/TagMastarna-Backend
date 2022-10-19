const nodemailer = require('nodemailer')

class Mailer{

  constructor() {
    this.transporter = nodemailer.createTransport({
      service: process.env.EMAIL_SERVICE,
      auth: {
        user: process.env.EMAIL_USERNAME,
        pass: process.env.EMAIL_PASSWORD
      }
    })
  }

  mail(body) {
    let options = {
      from: "Tågmästarna AB",
      to: body.email,
      subject: "Bokningsbekräftelse",
      text: 'Bokning bekräftad',
      //attachment: body.qrCode
      html:
        `<div style='background-color:orange;border-radius:15px; padding: 10px'><div><h1>Bokningsbekräftelse<h1/><h3>Avgångstid:  
        ${body.bookingInfo.date}</h3>
        <h3>Boknings ID: ${body.bookingInfo.id}</h3>
        </div > `
    };

    this.transporter.sendMail(options, (err, info) => {
      if (err) {
        console.log(err)
        return false;
      }
      console.log("Sent" + info.response)
      return true; 
    });
  }

}

module.exports = Mailer;