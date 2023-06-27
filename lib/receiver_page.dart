/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_management/colors.dart';
import 'package:food_management/homepage.dart';
import 'package:food_management/widgets/big_text.dart';
import 'package:food_management/widgets/small_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:food_management/update.dart';

import 'food_page_body.dart';

class RecevierPage extends StatefulWidget {
  const RecevierPage({Key? key}) : super(key: key);

  @override
  State<RecevierPage> createState() => _RecevierPageState();
}

class _RecevierPageState extends State<RecevierPage> {
  Query receiverPageRef = FirebaseDatabase.instance.ref().child('ReceiverPage');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('ReceiverPage');
  @override
  Widget listItem({required Map receiverPage}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      color: Colors.lightBlueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            receiverPage['name']?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            receiverPage['address']?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            receiverPage['phone number']?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            receiverPage['items']?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            receiverPage['quantity']?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Of Donors'),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: receiverPageRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

              Map receiverPage = snapshot.value as Map;
              receiverPage['key'] = snapshot.key;

              return listItem(receiverPage: receiverPage);

            },
          ),
        )
    );
  }
}*/
/*import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_management/colors.dart';
import 'package:food_management/homepage.dart';
import 'package:food_management/widgets/big_text.dart';
import 'package:food_management/widgets/small_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:food_management/update.dart';

import 'food_page_body.dart';

class RecevierPage extends StatefulWidget {
  const RecevierPage({Key? key}) : super(key: key);

  @override
  State<RecevierPage> createState() => _RecevierPageState();
}

class _RecevierPageState extends State<RecevierPage> {
  late Query receiverPageRef;
  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    receiverPageRef = FirebaseDatabase.instance.ref().child('ReceiverPage');
    _subscription = receiverPageRef.onChildChanged.listen(_onChildChanged as void Function(DatabaseEvent event)?);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _onChildChanged(Event event) {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget listItem({required Map receiverPage}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      color: Colors.lightBlueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            receiverPage['name'] ?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            receiverPage['address'] ?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            receiverPage['phone number'] ?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            receiverPage['items'] ?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            receiverPage['quantity'] ?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Of Donors'),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: receiverPageRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map receiverPage = snapshot.value as Map;
              receiverPage['key'] = snapshot.key;
              return listItem(receiverPage: receiverPage);
            },
          ),
        ));
  }
}
*/
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'donorupdate.dart';

class RecevierPage extends StatefulWidget {
  const RecevierPage({Key? key}) : super(key: key);

  @override
  State<RecevierPage> createState() => _RecevierPageState();
}

class _RecevierPageState extends State<RecevierPage> {
  final Query donorViewListRef = FirebaseDatabase.instance.ref().child('DonorViewList');
  final DatabaseReference reference = FirebaseDatabase.instance.ref().child('DonorViewList');
  late TextEditingController passwordController;

  Widget listItem({required Map donorViewList}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Name:\t\t',
                style: GoogleFonts.arvo(fontSize: 23, fontWeight: FontWeight.w400),
              ),
              Text(
                donorViewList['name'] ?? '',
                style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Address:\t\t',
                style: GoogleFonts.arvo(fontSize: 23, fontWeight: FontWeight.w400),
              ),
              Text(
                donorViewList['address'] ?? '',
                style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Food :',
                style: GoogleFonts.arvo(fontSize: 23, fontWeight: FontWeight.w300),
              ),
              Row(
                children: [
                  Text(
                    '\t\t\t\t\tItems:\t\t',
                    style: GoogleFonts.arvo(fontSize: 23, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    donorViewList['items'] ?? '',
                    style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    '\t\t\t\t\tQuantity:\t\t',
                    style: GoogleFonts.arvo(fontSize: 23, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    donorViewList['quantity'] ?? '',
                    style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Phone Number:\t\t',
                style: GoogleFonts.arvo(fontSize: 23, fontWeight: FontWeight.w400),
              ),
              Text(
                donorViewList['phone number'] ?? '',
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
    // Return your widget here
    return Scaffold(
      backgroundColor: Color(0XFFF5EBEB),
      appBar: AppBar(
       backgroundColor: Color(0XFF4E6C50),
        title:  Text('View List of Food Items',style: GoogleFonts.arvo(fontSize: 30,color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: FirebaseAnimatedList(
            query: donorViewListRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
              Map donorViewList = snapshot.value as Map;
              donorViewList['key'] = snapshot.key;
              // donorViewList['password'] = snapshot.value?['password'];
              return listItem(donorViewList: donorViewList);
            },
          ),
        ),
      ),
    );
  }

}


