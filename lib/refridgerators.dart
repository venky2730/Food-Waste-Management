import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:food_management/donor_page.dart';
import 'package:food_management/homepage.dart';
import 'package:food_management/volunteerlist.dart';
import 'package:google_fonts/google_fonts.dart';
import "colors.dart" as color;
import 'communityinfo.dart';


class Refrigerators extends StatefulWidget {
  const Refrigerators({Key? key}) : super(key: key);

  @override
  State<Refrigerators> createState() => _RefrigeratorsState();
}

class _RefrigeratorsState extends State<Refrigerators> {
  List fridge_info = [];

  _initData() async {
    DefaultAssetBundle.of(context).loadString("json/fridge.json").then((value) {
      setState(() {
        fridge_info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              /*gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.teal,
                ],
                begin: const FractionalOffset(0.0, 0.4),
                end: Alignment.topRight,
              )*/
            color: Color(0XFF4E6C50),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                  right: 30,
                ),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 270,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Icon(Icons.arrow_back_ios, size: 20, color: Colors.lime),
                        Expanded(child: Container()),
                        //Icon(Icons.info_outline, size: 20, color: Colors.lime),
                        IconButton(
                          icon: Icon(Icons.info),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InfoPage()),
                            );
                          },
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "COMMUNITY FRIDGES",
                      style: GoogleFonts.arvo(
                          fontSize: 30,fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "ANNAMPARABRAHMASWAROOPAM",
                      style: GoogleFonts.arvo(
                          fontSize: 20,
                          color: Colors.white),

                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_city,
                                size: 20,
                                color: Colors.deepOrange,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "VSK",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(70),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "AVAILABLE LOCATIONS :",
                            style: GoogleFonts.arvo(
                              fontSize: 23,
                              fontWeight: FontWeight.w300,
                              color: Colors.deepOrange[900],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Expanded(child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 8),
                          itemCount: fridge_info.length,
                          //no.of lists in the page
                          itemBuilder: (_, int index) {
                            return GestureDetector(
                              onTap: () {
                                debugPrint(index.toString());
                              },
                              child: _buildCard(index),
                            );
                          })),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
  _buildCard(int index) {
    if (fridge_info[index] != null) {
      return Container(
        height: 175,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        fridge_info[index]["img"],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fridge_info[index]["title"],
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        color: Colors.brown,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        fridge_info[index]["address"],
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
