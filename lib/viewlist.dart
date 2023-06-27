import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:food_management/volunteers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'donorupdate.dart';

class ViewList extends StatefulWidget {
  const ViewList({Key? key}) : super(key: key);

  @override
  State<ViewList> createState() => _ViewListState();
}

class _ViewListState extends State<ViewList> {
  final Query donorViewListRef = FirebaseDatabase.instance.ref().child('DonorViewList');
  final DatabaseReference reference = FirebaseDatabase.instance.ref().child('DonorViewList');
  late TextEditingController passwordController;
  List<TextEditingController> itemsControllerList = [];
  List<TextEditingController> quantityControllerList = [];

  void _addItem() {
    setState(() {
      itemsControllerList.add(TextEditingController());
      quantityControllerList.add(TextEditingController());
    });
  }


  Widget listItem({required Map donorViewList}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height:215,
      color: Colors.white,
      /*decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink.shade100,
              Colors.deepOrangeAccent.shade100,
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          )
        // color: Colors.purple[200],
      ),*/
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Name: \t\t',
                style: GoogleFonts.arvo(fontSize: 20, fontWeight: FontWeight.w300),
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
                style: GoogleFonts.arvo(fontSize: 20, fontWeight: FontWeight.w300),
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
          /*Text(
            donorViewList['items'] ?? '',
            style: GoogleFonts.tillana(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            donorViewList['quantity'] ?? '',
            style:GoogleFonts.tillana(fontSize: 16, fontWeight: FontWeight.w400),
          ),*/
          /*Row(
            children: [
              Text(
                'Items:\t',
                style: GoogleFonts.arvo(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Text(
                donorViewList['items'] ?? '',
                style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w400),
              ),

              const SizedBox(
                width: 10,
              ),
              Text(
                'Quantity:\t',
                style: GoogleFonts.arvo(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Text(
                donorViewList['quantity'] ?? '',
                style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w400),
              ),
            ],
          ),*/
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
                    style: GoogleFonts.arvo(fontSize: 20, fontWeight: FontWeight.w400),
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
                    style: GoogleFonts.arvo(fontSize: 20, fontWeight: FontWeight.w300),
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
                style: GoogleFonts.arvo(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              Text(
                donorViewList['phone number'] ?? '',
                style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
               /* onTap: () {
                  passwordController = TextEditingController();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Enter Password"),
                        content: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(hintText: "Password"),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () async {
                              await _checkPassword(donorViewList['password'], passwordController.text, donorViewList);
                              passwordController.clear();
                            },
                            child: const Text("Ok"),
                          ),
                        ],
                      );
                    },
                  );
                },*/
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateRecord2(donorViewListKey: donorViewList['key'])));
                },

                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
               /* onTap: () {
                  passwordController = TextEditingController();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Enter Password"),
                        content: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(hintText: "Password"),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () async {
                              await _checkPassword2(donorViewList['password'], passwordController.text, donorViewList);
                              passwordController.clear();
                            },
                            child: const Text("Ok"),
                          ),
                        ],
                      );
                    },
                  );
                },*/
                onTap: () {
                  reference.child(donorViewList['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  Future<void> _checkPassword(String? correctPassword, String enteredPassword, Map donorViewList) async {
    if (enteredPassword == correctPassword) {
      Navigator.pop(context);
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpdateRecord2(donorViewListKey: donorViewList['key'],)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect password'),
        ),
      );
    }
  }
  Future<void> _checkPassword2(String? correctPassword, String enteredPassword, Map donorViewList) async {
    if (enteredPassword == correctPassword) {
      await reference.child(donorViewList['key']).remove();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('The entered password is correct. The record has been deleted.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect password'),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    // Return your widget here
    return Scaffold(
     // backgroundColor:Color(0XFFF5EBEB),
      backgroundColor: const Color(0XFFF5EBEB),
      appBar: AppBar(
        backgroundColor: Color(0XFF4E6C50),
        title:  Text('Edit List',style: GoogleFonts.arvo(fontSize: 30),),

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

