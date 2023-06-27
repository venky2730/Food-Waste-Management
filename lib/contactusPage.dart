import 'package:flutter/material.dart';
import 'package:food_management/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  final String phoneNumber = 'tel:+918179310218';
  final String emailAddress = 'mailto:letsfridgeit@gmail.com';
  final String smsNumber = 'sms:+91 9848040655';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (_) => Volunteers()));
            Navigator.pop(context);
          },
        ),
        title: Text('Contact Us',style: GoogleFonts.arvo(fontSize: 30),),
        //backgroundColor: Color(0XFF61876E),
          backgroundColor:Color(0XFF4E6C50),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Get in touch with us!',
              style: GoogleFonts.roboto(fontSize: 35,fontWeight: FontWeight.bold, color: Color(0XFFA7727D),),
            ),
            SizedBox(height: 40.0),
            InkWell(
              onTap: () => launch(smsNumber),
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                 // color: Color(0XFF94AF9F),
                    //color:Color(0XFFFFAE6D),
                  color:Color(0XFFD17E00),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Send SMS',
                      style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0,),
                    ),
                    Spacer(),
                    Text(
                      '+91 9848040655',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            InkWell(
              onTap: () => launch(emailAddress),
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                 // color: Color(0XFF94AF9F),
                  color:Color(0XFFC3A657),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Send Email',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'letsfridgeit@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            InkWell(
              onTap: () => launch(phoneNumber),
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  //color: Color(0XFF94AF9F),
                 // color:Color(0XFFFECD70),
                  color: Color(0XFFD3A75A),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Call Us',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '+91 9848040655',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
