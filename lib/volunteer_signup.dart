/*import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_management/volunteerlist.dart';

class VolunteersSignUp extends StatefulWidget {
  const VolunteersSignUp({Key? key}) : super(key: key);

  @override
  State<VolunteersSignUp> createState() => _VolunteersSignUp();
}

class _VolunteersSignUp extends State<VolunteersSignUp> {

  final  userNameController = TextEditingController();
  final  addressController= TextEditingController();
  final  phonenumberController =TextEditingController();

  late DatabaseReference volunteerRef;

  @override
  void initState() {
    super.initState();
    volunteerRef = FirebaseDatabase.instance.ref().child('Volunteers');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Volunteer Sign Up'),
            GestureDetector(
              onTap: () {
                // Navigate to the list page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VolunteerList()),
                );
              },
              child: Row(
                children: [
                  Text('View List'),
                  const Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Happy To Join Our Community 🙂',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Your Name',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: addressController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                  hintText: 'Enter Your Address',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: phonenumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  hintText: 'Enter Your phone number',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  Map<String, String> volunteers = {
                    'name': userNameController.text,
                    'address': addressController.text,
                    'phone number': phonenumberController.text
                  };

                  volunteerRef.push().set(volunteers);
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
                              addressController.clear();
                              phonenumberController.clear();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Register Now'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_management/volunteerlist.dart';
import 'package:google_fonts/google_fonts.dart';

class VolunteersSignUp extends StatefulWidget {
  const VolunteersSignUp({Key? key}) : super(key: key);

  @override
  State<VolunteersSignUp> createState() => _VolunteersSignUp();
}

class _VolunteersSignUp extends State<VolunteersSignUp> {
  final userNameController = TextEditingController();
  final addressController = TextEditingController();
  final phonenumberController = TextEditingController();


  late DatabaseReference volunteerRef;

  @override
  void initState() {
    super.initState();
    volunteerRef = FirebaseDatabase.instance.ref().child('Volunteers');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0XFF4E6C50),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Volunteer Sign Up',style: GoogleFonts.arvo(fontSize: 25,color: Colors.white),),
            GestureDetector(
              onTap: () {
                // Navigate to the list page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VolunteerList()),
                );
              },
              child: Row(
                children: [
                  Text('View List',style: GoogleFonts.arvo(fontSize: 20,color: Colors.white),),
                  const Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
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
                  'Happy To Join Our Community 🙂',
                  style: GoogleFonts.arvo(fontSize: 25, fontWeight: FontWeight.w500,),
                  //textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: ' Name',
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: addressController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                    hintText: ' Address',
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: phonenumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    hintText: 'Phone number',
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const SizedBox(
                  height: 35,
                ),
                MaterialButton(
                  onPressed: () {
                    Map<String, String> volunteers = {
                      'name': userNameController.text,
                      'address': addressController.text,
                      'phone number': phonenumberController.text,

                    };

                    volunteerRef.push().set(volunteers);
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
                                addressController.clear();
                                phonenumberController.clear();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Register Now',style: TextStyle(fontSize: 25),),
                  color: Color(0XFFCC704B),
                  textColor: Colors.white,
                  minWidth: 250,
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
