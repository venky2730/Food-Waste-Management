import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (_) => Volunteers()));
            Navigator.pop(context);
          },
        ),
        title: Text('About Us',style: GoogleFonts.arvo(fontSize: 30),),
        //backgroundColor: Color(0XFF61876E),
        backgroundColor:Color(0XFF4E6C50),
      ),
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.white,
          color:Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 400,
                height: 700,
                color: Colors.white,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Main Motto',
                          style: GoogleFonts.arvo(fontSize: 30, color: Colors.deepOrange[900],),
                        ),
                        TextSpan(
                          text: '\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t(To minimize the Food Wastage)',
                          style: GoogleFonts.abel(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.brown[300],),
                        ),
                        TextSpan(
                          text: '\n\n\t\t⁕\t\tWe the LETS FRIDGE IT community aims to help the needy and poor by donating the excessive food and necessities by keeping them in community fridges.',
                          style: GoogleFonts.roboto(fontSize: 18, color: Colors.black,),
                         // textAlign: TextAlign.center,
                        ),
                        TextSpan(
                          text: '\n\n\t\t⁕\t\tThis community is dedicated to eliminate hunger and food wastage in Vizag keeping food out of landfills, dump yards and reducing green house gases.',
                          style: GoogleFonts.roboto(fontSize: 18, color: Colors.black,),
                         // textAlign: TextAlign.center,
                        ),
                        TextSpan(
                          text: '\n\n\t\t⁕\tWe also engage volunteers and food donors through our app to connect and donate the surplus food or necessities directly to NGOs, social service agencies, oldage homes or orphanages serving the food insecure. ',
                          style: GoogleFonts.roboto(fontSize: 18, color: Colors.black,),
                          //textAlign: TextAlign.center,
                        ),
                        TextSpan(
                          text: '\n\n\t\t⁕\tCommunity fridges locations are provided so that any person can directly go and keep the products in there. The person in need can visit the community fridges and take the required items.',
                          style: GoogleFonts.roboto(fontSize: 18, color: Colors.black,),
                        //  textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
