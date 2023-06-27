import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:food_management/update.dart';
import 'package:google_fonts/google_fonts.dart';

class VolunteerList extends StatefulWidget {
  const VolunteerList({Key? key}) : super(key: key);

  @override
  State<VolunteerList> createState() => _VolunteerList();
}

class _VolunteerList extends State<VolunteerList> {

  Query volunteerRef = FirebaseDatabase.instance.ref().child('Volunteers');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Volunteers');

  Widget listItem({required Map volunteers}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 140,
      //color: Colors.white,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Name:',
                style: GoogleFonts.arvo(fontSize: 20, ),
              ),
              SizedBox(width: 3,),
              Text(
                volunteers['name'],
                style: GoogleFonts.roboto(fontSize: 20,),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text(
                'Address:',
                style: GoogleFonts.arvo(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 3,),
              Text(
                volunteers['address'],
                style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height:6,
          ),
          Row(
            children: [
              Text(
                'Phone Number:',
                style: GoogleFonts.arvo(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 3,),
              Text(
                volunteers['phone number'],
                style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5EBEB),
        appBar: AppBar(
          title: const Text('List Of Volunteers'),
          backgroundColor: Color(0XFF4E6C50),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: volunteerRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

              Map volunteers = snapshot.value as Map;
              volunteers['key'] = snapshot.key;

              return listItem(volunteers: volunteers);

            },
          ),
        )
    );
  }
}


