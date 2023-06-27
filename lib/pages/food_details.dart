import 'package:flutter/material.dart';

class DataBoxPage extends StatefulWidget {
  @override
  _DataBoxPageState createState() => _DataBoxPageState();
}

class _DataBoxPageState extends State<DataBoxPage> {
  List<String> dataList = [];

  TextEditingController dataController = TextEditingController();

  void addDataToList(String data) {
    setState(() {
      dataList.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Box Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: dataController,
              decoration: InputDecoration(
                hintText: "Enter data",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String data = dataController.text;
                addDataToList(data);
              },
              child: Text("Submit"),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(dataList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
