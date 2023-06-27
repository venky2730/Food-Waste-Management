/*import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your feedback:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _feedbackController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type your feedback here',
              ),
              maxLines: null,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _sendFeedback,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _sendFeedback() async {
    // Get the user's email address from their device
    final String? emailAddress = await _getUserEmail();

    if (emailAddress != null) {
      // Create the email message
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'your.feedback.email@example.com',
        queryParameters: {
          'subject': 'Feedback',
          'body': _feedbackController.text + '\n\nSent from: $emailAddress'
        },
      );

      // Launch the user's default email app with the message pre-filled
      await launch(emailLaunchUri.toString());

      // Show a snackbar message to indicate that the email was sent
      final snackbar = SnackBar(
        content: Text('Your feedback has been sent!'),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

      // Clear the text field
      _feedbackController.clear();
    } else {
      // Show a snackbar message to indicate that the user's email address could not be retrieved
      final snackbar = SnackBar(
        content: Text('Sorry, we were unable to retrieve your email address.'),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  Future<String?> _getUserEmail() async {
    String? emailAddress;
    try {
      // Retrieve the user's email address from their device
      List<String> emailList = (await launch('mailto:')) as List<String>;
      if (emailList.isNotEmpty) {
        emailAddress = emailList[0];
      }
    } catch (e) {
      print('Error retrieving user email address: $e');
    }
    return emailAddress;
  }
}
*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _feedbackController = TextEditingController();

  void _sendFeedback(String feedbackText) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'letsfridgeit@gmail.com',
      queryParameters: {'subject': 'Feedback', 'body': feedbackText},
    );
    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Feedback Submitted'),
          content: const Text('Thank you for your feedback.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
      _feedbackController.clear();
    } else {
      throw 'Could not launch email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (_) => Volunteers()));
            Navigator.pop(context);
          },
        ),
        title:  Text('Feedback',style: GoogleFonts.arvo(fontSize: 30),),
       // backgroundColor: Colors.purple[100],
        backgroundColor:Color(0XFF4E6C50),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100,left: 30,right: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _feedbackController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Enter your feedback here...',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _sendFeedback(_feedbackController.text);
                  }
                },
                child:  Text('Submit',style: GoogleFonts.acme(fontSize: 19),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0XFFCC704B)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
