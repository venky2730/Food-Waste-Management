import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdateRecord2 extends StatefulWidget {
  const UpdateRecord2({Key? key, required this.donorViewListKey,  }) : super(key: key);
  final String donorViewListKey;

  @override
  State<UpdateRecord2> createState() => _UpdateRecord2State();
}

class _UpdateRecord2State extends State<UpdateRecord2> {

  final userNameController = TextEditingController();
  final itemsController = TextEditingController();
  final addressController = TextEditingController();
  final phonenumberController = TextEditingController();
  final quantityController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('DonorViewList');
    getDonorViewListData();
  }

  void getDonorViewListData() async {
    DataSnapshot snapshot = await dbRef.child(widget.donorViewListKey).get();

    Map donorViewList = snapshot.value as Map;

    userNameController.text = donorViewList ['name'];
    itemsController.text = donorViewList ['items'];
    addressController.text = donorViewList ['address'];
    quantityController.text = donorViewList ['quantity'];
    phonenumberController.text = donorViewList ['phonenumber'];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor View List'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (_) => Volunteers()));
            Navigator.pop(context);
          },
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
                const Text(
                  "Donor's List",
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
                  controller: itemsController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'items',
                    hintText: 'Enter Your items',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: addressController,
                  keyboardType: TextInputType.number,
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
                    hintText: 'Enter Your Phone Number',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'quantity',
                    hintText: 'Enter Your quantity',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    Map<String, String> donorViewList = {
                      'name': userNameController.text,
                      'items': itemsController.text,
                      'address': addressController.text,
                      'phonenumber': phonenumberController.text,
                      'quantity': quantityController.text
                    };
                    dbRef.child(widget.donorViewListKey).update(donorViewList)
                        .then((value) =>
                    {
                      Navigator.pop(context)
                    });
                  },
                  child: const Text('Update Data'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  minWidth: 300,
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


