/*import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_management/viewlist.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

class DonarSignUpPage extends StatefulWidget {
  const DonarSignUpPage({Key? key}) : super(key: key);

  @override
  State<DonarSignUpPage> createState() => _DonarSignUpPageState();
}

class _DonarSignUpPageState extends State<DonarSignUpPage> {
  List<TextEditingController> itemsControllerList = [];
  List<TextEditingController> quantityControllerList = [];
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final addressController = TextEditingController();
  final phonenumberController = TextEditingController();
  final quantityController = TextEditingController();
  final itemsController = TextEditingController();
  final passwordController = TextEditingController();
  late DatabaseReference donorViewListRef;
  late DatabaseReference receiverPageRef;
//  late DatabaseReference passwordRef;
  void _addItem() {
    setState(() {
      TextEditingController newItemController = TextEditingController();
      TextEditingController newQuantityController = TextEditingController();
      itemsControllerList.add(newItemController);
      quantityControllerList.add(newQuantityController);
    });
  }


  @override
  void initState() {
    super.initState();
    donorViewListRef = FirebaseDatabase.instance.ref().child('DonorViewList');
    receiverPageRef = FirebaseDatabase.instance.ref().child('ReceiverPage');
 //   passwordRef = FirebaseDatabase.instance.ref().child('Passwords');
  }
  bool showPointer= false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.purple[50],
      //backgroundColor: Color(0XFFDAE2B6),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.teal,],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (_) => Volunteers()));
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.purple.shade50,
          title: Text('Donor Sign Up',style: GoogleFonts.fasthand(fontSize: 40,color: Colors.white),),
        ),
        body: SingleChildScrollView(
            child: Center(
            child: Padding(
            padding: EdgeInsets.all(8.0),
              child: Column(
                 children: [
                const SizedBox(
                 height: 50,
                ),
               Text(
                 'Add your Excess Food Save the Hunger ❤',
                style: GoogleFonts.eduNswActFoundation(
                fontSize: 29,
                fontWeight: FontWeight.w500,
               ),
               textAlign: TextAlign.center,
               ),
              SizedBox(height: 30,),
                   Padding(
                       padding: EdgeInsets.symmetric(
                           horizontal: 8, vertical: 4),
                       child: TextFormField(
                           controller: userNameController,
                           textAlign: TextAlign.center,
                           decoration: InputDecoration(
                             icon: Icon(Icons.person),
                             border: OutlineInputBorder(),
                             hintText: " Name",
                           ),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return "Please enter your name";
                             }
                             else if (value.length < 4) {
                               return "too short name";
                             }

                             return null;
                           }
                       )
                   ),
               const SizedBox(height: 30,),
                    Padding(
                     padding: EdgeInsets.only(top: 8, bottom: 4),
                     child: TextFormField(
                       controller: addressController,
                       textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         icon: Icon(Icons.home_filled),
                         border: OutlineInputBorder(),
                         hintText: "Address",
                       ),
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return "Please enter correct address";
                         }
                         return null;
                       },
                     ),
                   ),
                   //const SizedBox(height: 30,),
                   /*Padding(
                     padding: EdgeInsets.only(top: 8, bottom: 4),
                     child: TextFormField(
                       controller: itemsController,
                       textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         icon: Icon(Icons.fastfood),
                         border: OutlineInputBorder(),
                         hintText: "Enter Items available with you ",
                       ),
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return "Please enter items";
                         }
                         return null;
                       },
                     ),
                   ),*/
                   //const SizedBox(height: 30,),
                   /*Padding(
                     padding: EdgeInsets.only(top: 8, bottom: 4),
                     child: TextFormField(
                       controller: quantityController,
                       textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         icon: Icon(Icons.format_list_numbered_rounded),
                         border: OutlineInputBorder(),
                         hintText: "Enter the quantity available with you ",
                       ),
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return "Please enter items";
                         }
                         return null;
                       },
                     ),
                   ),*/
                   const SizedBox(height: 30,),
                   Padding(
                     padding: EdgeInsets.only(top: 8, bottom: 4),
                     child: TextFormField(
                       controller: phonenumberController,
                       textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         icon: Icon(Icons.phone),
                         border: OutlineInputBorder(),
                         hintText: "PhoneNumber",
                       ),
                       validator: (value) {
                         String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                         RegExp regExp = new RegExp(patttern);
                         if (value == null || value.isEmpty) {
                           return "Please enter correct ph.number";
                         }
                         else if (value.length > 10 || value.length < 10) {
                           return "Enter 10-digit number";
                         }
                         else if (!regExp.hasMatch(value)) {
                           return " Enter correct mobile number";
                         }
                         return null;
                       },

                     ),
                   ),
                   const SizedBox(height: 30,),
                   /*Padding(
                     padding: EdgeInsets.only(top: 8,bottom: 4,left: 30),
                     child: Container(
                       decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: Row(
                         children: [
                           Expanded(
                             flex: 2,
                             child: Padding(
                               padding: EdgeInsets.symmetric(horizontal: 8),
                               child: TextFormField(
                                 controller: itemsController,
                                 textAlign: TextAlign.center,
                                 decoration: InputDecoration(
                                   hintText: 'Enter Item',
                                   border: InputBorder.none,
                                 ),
                               ),
                             ),
                           ),
                           Expanded(
                             child: Padding(
                               padding: EdgeInsets.symmetric(horizontal: 8),
                               child: TextFormField(
                                 controller: quantityController,
                                 keyboardType: TextInputType.number,
                                 textAlign: TextAlign.center,
                                 decoration: InputDecoration(
                                   hintText: 'Qty',
                                   border: InputBorder.none,
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),*/ // add this variable to control when to show the pointer

           /* Padding(
            padding: EdgeInsets.only(top: 8,bottom: 4,left: 30),
              child: Stack( // wrap the row with a Stack widget to position the arrow-shaped container
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: TextFormField(
                              controller: itemsController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Enter Item',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: TextFormField(
                              controller: quantityController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Qty',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() { // set the showPointer variable to true to show the pointer
                              showPointer = true;
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  if (showPointer) Positioned( // show the arrow-shaped container if showPointer is true
                    top: 60, // adjust this value to position the container correctly
                    left: 40, // adjust this value to position the container correctly
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Icon(Icons.arrow_drop_down, color: Colors.grey),
                          Text('Pointer message here'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),*/
                 /*  Padding(
                     padding: EdgeInsets.only(top: 8,bottom: 4,left: 30),
                     child: Stack(
                       children: [
                         Expanded(
                           flex: 2,
                           child: Padding(
                             padding: EdgeInsets.symmetric(horizontal: 8),
                             child: Row(
                               children: [
                                 Expanded(
                                   child: Padding(
                                     padding: EdgeInsets.only(right: 10),
                                     child: TextFormField(
                                       controller: itemsController,
                                       textAlign: TextAlign.center,
                                       decoration: InputDecoration(
                                         hintText: 'Item ',
                                         border: InputBorder.none,
                                       ),
                                     ),
                                   ),
                                 ),
                                 Expanded(
                                   child: TextFormField(
                                     controller: quantityController,
                                     keyboardType: TextInputType.number,
                                     textAlign: TextAlign.center,
                                     decoration: InputDecoration(
                                       hintText: 'Qty',
                                       border: InputBorder.none,
                                     ),
                                   ),
                                 ),
                                /* InkWell(
                                   onTap: () {
                                     setState(() {
                                       showPointer = true;
                                     });
                                   },
                                   child: Icon(Icons.add),
                                 ),*/
                                 IconButton(
                                   icon: Icon(Icons.add),
                                   onPressed: () {
                                     _addItem();
                                   },
                                 )
                               ],
                             ),
                           ),
                         ),
                         if (showPointer) Positioned(
                           top: 110, // adjust this value to position the container below the items column
                           left: 40,
                           child: Container(
                             width: 200,
                             height: 50,
                             decoration: BoxDecoration(
                               color: Colors.white,
                               boxShadow: [
                                 BoxShadow(
                                   color: Colors.grey.withOpacity(0.5),
                                   spreadRadius: 2,
                                   blurRadius: 5,
                                   offset: Offset(0, 3),
                                 ),
                               ],
                             ),
                             child: Column(
                               children: [
                                 SizedBox(height: 10),
                                 Icon(Icons.arrow_drop_down, color: Colors.grey),
                                 Text('Pointer message here'),
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   )*/
                   ListView.builder(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemCount: itemsControllerList.length,
                     itemBuilder: (BuildContext context, int index) {
                       return Row(
                         children: [
                           Expanded(
                             child: Padding(
                               padding: EdgeInsets.only(right: 10),
                               child: TextFormField(
                                 controller: itemsControllerList[index],
                                 textAlign: TextAlign.center,
                                 decoration: InputDecoration(
                                   hintText: 'Item ',
                                   border: InputBorder.none,
                                 ),
                               ),
                             ),
                           ),
                           Expanded(
                             child: TextFormField(
                               controller: quantityControllerList[index],
                               textAlign: TextAlign.center,
                               decoration: InputDecoration(
                                 hintText: 'Quantity',
                                 border: InputBorder.none,
                               ),
                             ),
                           ),
                         ],
                       );
                     },
                   ),
                   IconButton(
                     icon: Icon(Icons.add),
                     onPressed: () {
                       _addItem();
                     },
                   ),
                   /* ElevatedButton(
                     /*onPressed: () {
                       setState(() {
                         itemsList.add({
                           'items': '',
                           'quantity': '',
                         });
                       });
                     },*/
                     onPressed: () {
                       setState(() {
                         itemsControllerList.add(TextEditingController());
                         quantityControllerList.add(TextEditingController());
                       });
                     },
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Icon(
                           Icons.add,
                           color: Color(0XFFDAE2B6),),
                         Text('Add items',style: GoogleFonts.lato(fontSize: 20),),
                       ],
                     ),
                   ),
                   /*ListView.builder(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemCount: itemsList.length,
                     itemBuilder: (BuildContext context, int index) {
                       return Row(
                         children: [
                           Expanded(
                             child: TextFormField(
                               onChanged: (value) {
                                 itemsList[index]['items'] = value;
                               },
                               decoration: InputDecoration(
                                 labelText: 'Items',
                                 hintText: 'Enter items',
                               ),
                             ),
                           ),
                           SizedBox(width: 16),
                           Expanded(
                             child: TextFormField(
                               onChanged: (value) {
                                 itemsList[index]['quantity'] = value;
                               },
                               decoration: InputDecoration(
                                 labelText: 'Quantity',
                                 hintText: 'Enter quantity',
                               ),
                             ),
                           ),
                         ],
                       );
                     },
                   ),*/
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: itemsList.length,
              itemBuilder: (BuildContext context, int index) {
                  return Row(
            children: [
            Expanded(
            child: TextFormField(
            controller: itemsController,
            onChanged: (value) {
            // Do nothing here
            },
            decoration: InputDecoration(
            labelText: 'Items',
            hintText: 'Enter items',
            ),
            ),
            ),
            SizedBox(width: 16),
            Expanded(
            child: TextFormField(
            controller: quantityController,
            onChanged: (value) {
            // Do nothing here
            },
            decoration: InputDecoration(
            labelText: 'Quantity',
            hintText: 'Enter quantity',
            ),
            ),
            ),
            ],
            );
            },
            ),*/
                   const SizedBox(height: 30,),

                   /*Padding(
                     padding: EdgeInsets.only(top: 8, bottom: 4),
                     child: TextFormField(
                       controller: passwordController,
                       textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         icon: Icon(Icons.password),
                         border: OutlineInputBorder(),
                         hintText: "Enter password",
                       ),
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return "Please enter correct address";
                         }
                         return null;
                       },
                     ),
                   ),*/
                  // const SizedBox(height: 30,),
                  /* MaterialButton(
                     onPressed: () {
                       Map<String, String> donorViewList = {
                         'name': userNameController.text,
                         'address': addressController.text,
                         'phone number': phonenumberController.text,
                         'items': itemsController.text,
                         'quantity': quantityController.text,
                         'password':passwordController.text,
                       };
                       donorViewListRef.push().set(donorViewList);
                       Map<String, String> receiverPage = {
                         'name': userNameController.text,
                         'address': addressController.text,
                         'phone number': phonenumberController.text,
                         'items': itemsController.text,
                         'quantity': quantityController.text,
                         'password':passwordController.text,
                       };
                       receiverPageRef.push().set(receiverPage);

                       showDialog(
                         context: context,
                         builder: (BuildContext context) {
                           return AlertDialog(
                             title: const Text('Thank you for joining!'),
                             actions: <Widget>[
                               TextButton(
                                 child: const Text('OK'),
                                 onPressed: () {
                                   Navigator.of(context).pop();
                                   // Clear the text fields
                                   userNameController.clear();
                                  itemsController.clear();
                                   quantityController.clear();
                                   addressController.clear();
                                   phonenumberController.clear();
                                   passwordController.clear();
                                 },
                               ),
                             ],
                           );
                         },
                       );
                       },
                     child: const Text('Submit'),
                     color: Colors.blue,
                     textColor: Colors.white,
                     minWidth: 300,
                     height: 40,
                   ),
                   MaterialButton(
                     onPressed: () {
                       // navigate to the page that displays the list
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => ViewList()),
                       );
                     },
                     child: const Text('Edit List'),
                     color: Colors.blue,
                     textColor: Colors.white,
                     minWidth: 300,
                     height: 40,
                   ),*/
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                      /* MaterialButton(
                         onPressed: () {
                           // Code to submit the form
                        //   List<Map<String, String>> itemsList = [];
                             Map<String, String> donorViewList = {
                               'name': userNameController.text,
                               'address': addressController.text,
                               'phone number': phonenumberController.text,
                               'items':itemsController.text,
                               'quantity':quantityController.text,
                             };
                             donorViewListRef.push().set(donorViewList);
                             Map<String, String> receiverPage = {
                               'name': userNameController.text,
                               'address': addressController.text,
                               'phone number': phonenumberController.text,
                               'items':itemsController.text,
                               'quantity':quantityController.text,
                               //'password':passwordController.text,
                             };
                             receiverPageRef.push().set(receiverPage);

                             showDialog(
                               context: context,
                               builder: (BuildContext context) {
                                 return AlertDialog(
                                   title:  Text('Thank you for joining!',),
                                   actions: <Widget>[
                                     TextButton(
                                       child:  Text('OK',),
                                       onPressed: () {
                                         Navigator.of(context).pop();
                                         // Clear the text fields
                                         userNameController.clear();
                                         itemsController.clear();
                                         quantityController.clear();
                                         addressController.clear();
                                         phonenumberController.clear();
                                        // itemsListString.clear();
                                       },
                                     ),
                                   ],
                                 );
                               },
                             );
                         },
                         color: Colors.purple[200],
                         textColor: Colors.white,
                         child: Text('Submit',style: GoogleFonts.abyssinicaSil(fontSize: 19),),
                       ),*/
                       /*MaterialButton(
                         onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewList()));
                         },
                         color: Colors.purple[200],
                         textColor: Colors.white,
                         child: Text('Edit List',style: GoogleFonts.abyssinicaSil(fontSize: 19),),
                       ),*/
                       MaterialButton(
                         onPressed: () {
                           String items = itemsControllerList.join(', ');
                           String quantity = quantityControllerList.join(', ');
    // Update the donorViewList and receiverPage maps with the converted strings
    Map<String, String> donorViewList = {
    'name': userNameController.text,
    'address': addressController.text,
    'phone number': phonenumberController.text,
    'items': items,
    'quantity': quantity,
    };
    donorViewListRef.push().set(donorViewList);
                           }


                           // Create donorViewList map


                           // Create receiverPage map

                           showDialog(
                             context: context,
                             builder: (BuildContext context) {
                               return AlertDialog(
                                 title: Text('Thank you for joining!'),
                                 actions: <Widget>[
                                   TextButton(
                                     child: Text('OK'),
                                     onPressed: () {
                                       Navigator.of(context).pop();
                                       // Clear the text fields and lists
                                       userNameController.clear();
                                       itemsController.clear();
                                       quantityController.clear();
                                       addressController.clear();
                                       phonenumberController.clear();
                                       itemsControllerList.clear();
                                       quantityControllerList.clear();
                                     },
                                   ),
                                 ],
                               );
                             },
                           );
                         },
                         color: Colors.purple[200],
                         textColor: Colors.white,
                         child: Text(
                           'Submit',
                           style: GoogleFonts.abyssinicaSil(fontSize: 19),
                         ),
                       ),


                     ],
                   ),

                 ],
              ),
            ),
            ),
        ),
    );
  }


*/
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_management/viewlist.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

class DonarSignUpPage extends StatefulWidget {
  const DonarSignUpPage({Key? key}) : super(key: key);

  @override
  State<DonarSignUpPage> createState() => _DonarSignUpPageState();
}

class _DonarSignUpPageState extends State<DonarSignUpPage> {
  List<TextEditingController> itemsControllerList = [];
  List<TextEditingController> quantityControllerList = [];
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final addressController = TextEditingController();
  final phonenumberController = TextEditingController();
  final quantityController = TextEditingController();
  final itemsController = TextEditingController();
  final passwordController = TextEditingController();
  late DatabaseReference donorViewListRef;
  late DatabaseReference receiverPageRef;
//  late DatabaseReference passwordRef;

  @override
  void initState() {
    super.initState();
    donorViewListRef = FirebaseDatabase.instance.ref().child('DonorViewList');
    receiverPageRef = FirebaseDatabase.instance.ref().child('ReceiverPage');
    //   passwordRef = FirebaseDatabase.instance.ref().child('Passwords');
  }
  bool showPointer= false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: Color(0XFFDAE2B6),
      appBar: AppBar(
        backgroundColor:Color(0XFF4E6C50),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (_) => Volunteers()));
            Navigator.pop(context);
          },
        ),
        title: Text('Donor Sign Up',style: GoogleFonts.arvo(fontSize: 30,color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Add your Excess Food here ❤',
                  style: GoogleFonts.arvo(
                    fontSize: 29,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30,),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    child: TextFormField(
                        controller: userNameController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person,color: Colors.black,),
                          border: OutlineInputBorder(),
                          hintText: " Name",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name";
                          }
                          else if (value.length < 4) {
                            return "too short name";
                          }

                          return null;
                        }
                    )
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 4),
                  child: TextFormField(
                    controller: addressController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      icon: Icon(Icons.home_filled,color: Colors.black,),
                      border: OutlineInputBorder(),
                      hintText: "Address",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter correct address";
                      }
                      return null;
                    },
                  ),
                ),
                //const SizedBox(height: 30,),
                /*Padding(
                     padding: EdgeInsets.only(top: 8, bottom: 4),
                     child: TextFormField(
                       controller: itemsController,
                       textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         icon: Icon(Icons.fastfood),
                         border: OutlineInputBorder(),
                         hintText: "Enter Items available with you ",
                       ),
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return "Please enter items";
                         }
                         return null;
                       },
                     ),
                   ),*/
                //const SizedBox(height: 30,),
                /*Padding(
                     padding: EdgeInsets.only(top: 8, bottom: 4),
                     child: TextFormField(
                       controller: quantityController,
                       textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         icon: Icon(Icons.format_list_numbered_rounded),
                         border: OutlineInputBorder(),
                         hintText: "Enter the quantity available with you ",
                       ),
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return "Please enter items";
                         }
                         return null;
                       },
                     ),
                   ),*/
                const SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 4),
                  child: TextFormField(
                    controller: phonenumberController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone,color: Colors.black,),
                      border: OutlineInputBorder(),
                      hintText: "PhoneNumber",
                    ),
                    validator: (value) {
                      String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      RegExp regExp = new RegExp(patttern);
                      if (value == null || value.isEmpty) {
                        return "Please enter correct ph.number";
                      }
                      else if (value.length > 10 || value.length < 10) {
                        return "Enter 10-digit number";
                      }
                      else if (!regExp.hasMatch(value)) {
                        return " Enter correct mobile number";
                      }
                      return null;
                    },

                  ),
                ),
                const SizedBox(height: 30,),
                /*Padding(
                     padding: EdgeInsets.only(top: 8,bottom: 4,left: 30),
                     child: Container(
                       decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: Row(
                         children: [
                           Expanded(
                             flex: 2,
                             child: Padding(
                               padding: EdgeInsets.symmetric(horizontal: 8),
                               child: TextFormField(
                                 controller: itemsController,
                                 textAlign: TextAlign.center,
                                 decoration: InputDecoration(
                                   hintText: 'Enter Item',
                                   border: InputBorder.none,
                                 ),
                               ),
                             ),
                           ),
                           Expanded(
                             child: Padding(
                               padding: EdgeInsets.symmetric(horizontal: 8),
                               child: TextFormField(
                                 controller: quantityController,
                                 keyboardType: TextInputType.number,
                                 textAlign: TextAlign.center,
                                 decoration: InputDecoration(
                                   hintText: 'Qty',
                                   border: InputBorder.none,
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),*/ // add this variable to control when to show the pointer

                /* Padding(
            padding: EdgeInsets.only(top: 8,bottom: 4,left: 30),
              child: Stack( // wrap the row with a Stack widget to position the arrow-shaped container
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: TextFormField(
                              controller: itemsController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Enter Item',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: TextFormField(
                              controller: quantityController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Qty',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() { // set the showPointer variable to true to show the pointer
                              showPointer = true;
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  if (showPointer) Positioned( // show the arrow-shaped container if showPointer is true
                    top: 60, // adjust this value to position the container correctly
                    left: 40, // adjust this value to position the container correctly
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Icon(Icons.arrow_drop_down, color: Colors.grey),
                          Text('Pointer message here'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),*/
                Padding(
                  padding: EdgeInsets.only(top: 8,bottom: 4,left: 30),
                  child: Stack(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: TextFormField(
                                      controller: itemsController,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.fastfood_outlined,color: Colors.black,),
                                        hintText: 'Item ',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: quantityController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.list,color: Colors.black,),
                                      hintText: 'Qty',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      showPointer = true;
                                    });
                                  },
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (showPointer) Positioned(
                        top: 110, // adjust this value to position the container below the items column
                        left: 40,
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Icon(Icons.arrow_drop_down, color: Colors.grey),
                              Text('Pointer message here'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /* ElevatedButton(
                     /*onPressed: () {
                       setState(() {
                         itemsList.add({
                           'items': '',
                           'quantity': '',
                         });
                       });
                     },*/
                     onPressed: () {
                       setState(() {
                         itemsControllerList.add(TextEditingController());
                         quantityControllerList.add(TextEditingController());
                       });
                     },
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Icon(
                           Icons.add,
                           color: Color(0XFFDAE2B6),),
                         Text('Add items',style: GoogleFonts.lato(fontSize: 20),),
                       ],
                     ),
                   ),
                   /*ListView.builder(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemCount: itemsList.length,
                     itemBuilder: (BuildContext context, int index) {
                       return Row(
                         children: [
                           Expanded(
                             child: TextFormField(
                               onChanged: (value) {
                                 itemsList[index]['items'] = value;
                               },
                               decoration: InputDecoration(
                                 labelText: 'Items',
                                 hintText: 'Enter items',
                               ),
                             ),
                           ),
                           SizedBox(width: 16),
                           Expanded(
                             child: TextFormField(
                               onChanged: (value) {
                                 itemsList[index]['quantity'] = value;
                               },
                               decoration: InputDecoration(
                                 labelText: 'Quantity',
                                 hintText: 'Enter quantity',
                               ),
                             ),
                           ),
                         ],
                       );
                     },
                   ),*/
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: itemsList.length,
              itemBuilder: (BuildContext context, int index) {
                  return Row(
            children: [
            Expanded(
            child: TextFormField(
            controller: itemsController,
            onChanged: (value) {
            // Do nothing here
            },
            decoration: InputDecoration(
            labelText: 'Items',
            hintText: 'Enter items',
            ),
            ),
            ),
            SizedBox(width: 16),
            Expanded(
            child: TextFormField(
            controller: quantityController,
            onChanged: (value) {
            // Do nothing here
            },
            decoration: InputDecoration(
            labelText: 'Quantity',
            hintText: 'Enter quantity',
            ),
            ),
            ),
            ],
            );
            },
            ),*/
                const SizedBox(height: 30,),

                /*Padding(
                     padding: EdgeInsets.only(top: 8, bottom: 4),
                     child: TextFormField(
                       controller: passwordController,
                       textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         icon: Icon(Icons.password),
                         border: OutlineInputBorder(),
                         hintText: "Enter password",
                       ),
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return "Please enter correct address";
                         }
                         return null;
                       },
                     ),
                   ),*/
                // const SizedBox(height: 30,),
                /* MaterialButton(
                     onPressed: () {
                       Map<String, String> donorViewList = {
                         'name': userNameController.text,
                         'address': addressController.text,
                         'phone number': phonenumberController.text,
                         'items': itemsController.text,
                         'quantity': quantityController.text,
                         'password':passwordController.text,
                       };
                       donorViewListRef.push().set(donorViewList);
                       Map<String, String> receiverPage = {
                         'name': userNameController.text,
                         'address': addressController.text,
                         'phone number': phonenumberController.text,
                         'items': itemsController.text,
                         'quantity': quantityController.text,
                         'password':passwordController.text,
                       };
                       receiverPageRef.push().set(receiverPage);

                       showDialog(
                         context: context,
                         builder: (BuildContext context) {
                           return AlertDialog(
                             title: const Text('Thank you for joining!'),
                             actions: <Widget>[
                               TextButton(
                                 child: const Text('OK'),
                                 onPressed: () {
                                   Navigator.of(context).pop();
                                   // Clear the text fields
                                   userNameController.clear();
                                  itemsController.clear();
                                   quantityController.clear();
                                   addressController.clear();
                                   phonenumberController.clear();
                                   passwordController.clear();
                                 },
                               ),
                             ],
                           );
                         },
                       );
                       },
                     child: const Text('Submit'),
                     color: Colors.blue,
                     textColor: Colors.white,
                     minWidth: 300,
                     height: 40,
                   ),
                   MaterialButton(
                     onPressed: () {
                       // navigate to the page that displays the list
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => ViewList()),
                       );
                     },
                     child: const Text('Edit List'),
                     color: Colors.blue,
                     textColor: Colors.white,
                     minWidth: 300,
                     height: 40,
                   ),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Map<String, String> donorViewList = {
                          'name': userNameController.text,
                          'address': addressController.text,
                          'phone number': phonenumberController.text,
                          'items':itemsController.text,
                          'quantity':quantityController.text,
                        };
                        donorViewListRef.push().set(donorViewList);
                        Map<String, String> receiverPage = {
                          'name': userNameController.text,
                          'address': addressController.text,
                          'phone number': phonenumberController.text,
                          'items':itemsController.text,
                          'quantity':quantityController.text,
                          //'password':passwordController.text,
                        };
                        receiverPageRef.push().set(receiverPage);

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title:  Text('Thank you for joining!',),
                              actions: <Widget>[
                                TextButton(
                                  child:  Text('OK',),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // Clear the text fields
                                    userNameController.clear();
                                    itemsController.clear();
                                    quantityController.clear();
                                    addressController.clear();
                                    phonenumberController.clear();
                                    // itemsListString.clear();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      color: Color(0XFFCC704B),
                      textColor: Colors.white,
                      minWidth: 200,
                      height: 50,
                      child: Text('Submit',style: GoogleFonts.roboto(fontSize: 28),),
                    ),
                    /*MaterialButton(
                         onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewList()));
                         },
                         color: Colors.purple[200],
                         textColor: Colors.white,
                         child: Text('Edit List',style: GoogleFonts.abyssinicaSil(fontSize: 19),),
                       ),*/
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

