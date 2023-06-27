import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage extends StatelessWidget {
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
        title: Text('Community Fridges',style: GoogleFonts.arvo(fontSize: 30),),
        backgroundColor:Color(0XFF4E6C50),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Container(
              width: 400,
              height: 700,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 15),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: ' \n⁕   This Community Fridges aims to minimize the food wastage that happens every day. ',
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                    TextSpan(
                      text: '\n\n⁕\tWe cannot completely eliminate food wastage but we can reduce the food wastage.\n\n',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                        TextSpan(
                          text:'⁕\tHere we have provided the availability of refridgerators in Vishakapatnam\n\n⁕\t Here the needey can directly take the food instead of some third party agencies. \n\n⁕\t  ',
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: 'Every one must take there individual step inorder to reduce the wastage. \n\n',
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                  TextSpan(
                    text: '⁕\tYou can act as a Volunteer or as a Donor or as a Rescuer by'
                        ' \n\n\t\t\t\t\t\t --adding the food in the app  '
                        '\n\n\t\t\t\t\t --taking the food and storing them in the community fridges'
                        '\n\n\t\t\t\t\t\t  --take the food and giving them to needy.',
                    style: GoogleFonts.roboto(
                  color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                      ],
                    ),
                  )



                  /*Text(
                    ' ⁕   This Community Fridges aims to minimize the food wastage that happens every day. '
                        '\n\n⁕\tMAIN MOTO : '
                        '\n\t\t\t\tWe cannot completely eliminate food wastage but we can reduce the food wastage'
                        '\n\n⁕\t\t This is our main moto '
                        '\n\n⁕\tHere we have provided the availability of refridgerators in Vishakapatnam\n Here the needey can directly take the food'
                         'instead of some third party agencies. \n Every one must take there individual step inorder to reduce the wastage'
                        '\n You can act as a Volunteer or as a Donor or as a Rescuer by \n adding the food in the app or \n takimg the food and keeping them in the community fridges'
                        '\n or take the food that are in the fridges and giving them directy to the people.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),*/
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
