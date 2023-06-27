import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToUsAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('How it works',style: GoogleFonts.arvo(fontSize: 30),),
        backgroundColor:Color(0XFF4E6C50),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 5,right: 5,bottom: 4),
          child: Container(
            color: Colors.white,
            child: Center(
              child: Container(
                width: 400,
                height: 900,
                color:Colors.white,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tCommunity Fridges',
                            style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFFCE9461)),
                          ),
                          TextSpan(
                            text: '\n\n⁕\tLocations of the community fridges in Visakhapatnam are mentioned in this page. Any individual who wish to donate food can go to the mentioned locations and keep surplus food, groceries or any items in the community fridges at free of cost. Similarly the food can be taken from the community fridge at free of cost by the needy.',
                            style: GoogleFonts.roboto(fontSize: 18, color: Colors.black),
                          ),
                          TextSpan(
                            text: '\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tDonor',
                            style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFFCE9461)),
                          ),
                          TextSpan(
                            text: '\n\n⁕\tIndividuals can donate excess food by providing details and mention the food available in quantity. Make sure the food is in good condition. Volunteers reach the donors location and collect food from them.',
                            style: GoogleFonts.roboto(fontSize: 18, color: Colors.black),
                          ),
                          TextSpan(
                            text: '\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVolunteer',
                            style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFFCE9461)),
                          ),
                          TextSpan(
                            text: '\n\n⁕\tAny individual interested need to sign up and create an account. Volunteers need to reach the donors and make sure the collected food reaches to the community Fridges. Volunteer to promote the community fridges and bring awareness among people.',
                            style: GoogleFonts.roboto(fontSize: 18, color: Colors.black),
                          ),
                          TextSpan(
                            text: '\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tList Of Food Items',
                            style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFFCE9461)),
                          ),
                          TextSpan(
                            text: '\n\n⁕\tThe food donated by the donors can be viewed in this list.',
                            style: GoogleFonts.roboto(fontSize: 18, color: Colors.black),
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
      ),
    );
  }
}
