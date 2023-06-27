import 'package:flutter/material.dart';
import 'package:food_management/homepage.dart';
import 'package:food_management/viewlist.dart';
import 'package:food_management/volunteer_signup.dart';
import 'package:food_management/volunteerlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Volunteers extends StatefulWidget {
  @override
  _VolunteersState createState() => _VolunteersState();
}

class _VolunteersState extends State<Volunteers> {
  final String correctPassword = "password"; // Change this to the correct password

  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _isPasswordIncorrect = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Volunteer',
      home: Container(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor:Color(0XFF4E6C50),
            title: Text(
              'Join Us',
              style: GoogleFonts.arvo(
                  fontSize: 35, color: Colors.white, wordSpacing: 5),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  //backgroundColor: MaterialStateProperty.all<Color>(Color(0XFFCC704B)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VolunteersSignUp()));
                  },
                  style: ElevatedButton.styleFrom(primary:Color(0XFFFA9884),minimumSize: Size(200, 60),),
                  child: Text(
                    'SignUp for Volunteers',
                    style: GoogleFonts.roboto(
                        fontSize: 20,color: Colors.white),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VolunteerList()));
                  },
                  style: ElevatedButton.styleFrom(primary:Color(0XFFFFA559),minimumSize: Size(200, 60)),
                  child: Text(
                    'List of Volunteers',
                    style: GoogleFonts.roboto(
                        fontSize: 20, ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _showPasswordDialog(context);
                  },
                  style: ElevatedButton.styleFrom(primary:Color(0XFFECA869),minimumSize: Size(200, 60)),
                  child: Text(
                    'Edit Donor List',
                    style: GoogleFonts.roboto(
                        fontSize: 20, ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    String? encodeQueryParameters(Map<String, String> params) {
                      return params.entries
                          .map((MapEntry<String, String> e) =>
                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                          .join('&');
                    }
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'letsfridgeit@gmail.com',
                      query: encodeQueryParameters(<String, String>{
                        'subject': 'Example Subject & Symbols are allowed!',
                      }),
                    );

                    launchUrl(emailLaunchUri);
                  },
                  style: ElevatedButton.styleFrom(primary:Color(0XFFF1A661),minimumSize: Size(200, 60)),
                  child: Text('Contact Admin for changes',style: GoogleFonts.roboto(fontSize: 20,),),
                    ),
            ],
            ),
          ),
      ),
    ),
   );
  }
}
void _showPasswordDialog(BuildContext context) {
  TextEditingController passwordController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter Password'),
        content: TextField(
          obscureText: true,
          controller: passwordController,
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            child: Text('Submit'),
            onPressed: () {
              String password = passwordController.text;

              // Replace 'password123' with the actual password
              if (password == 'password123') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewList()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Incorrect password')),
                );
              }
            },
          ),
        ],
      );
    },
  );
}
/*import'package:flutter/material.dart';
import'package:food_management/homepage.dart';
import'package:food_management/viewlist.dart';
import'package:food_management/volunteer_signup.dart';
import'package:food_management/volunteerlist.dart';
import'package:google_fonts/google_fonts.dart';
//'package:url_launcher/url_launcher.dart';
import'package:url_launcher/url_launcher.dart';


classVolunteersextendsStatelessWidget{
@override
Widgetbuild(BuildContextcontext){
returnMaterialApp(
debugShowCheckedModeBanner:false,
title:'Volunteer',
home:Container(
child:Scaffold(
backgroundColor:Colors.purple[50],
appBar:AppBar(
backgroundColor:Colors.purple[100],
title:Text('Happytojoin',style:GoogleFonts.fasthand(fontSize:35,color:Colors.white,wordSpacing:5),),
leading:IconButton(
icon:Icon(Icons.arrow_back),
onPressed:()=>Navigator.push(
context,
MaterialPageRoute(builder:(context)=>HomePage()),
),
),
centerTitle:true,
flexibleSpace:Padding(
padding:EdgeInsets.only(top:30),
child:Container(
//color:Colors.purple[200],
decoration:BoxDecoration(
gradient:LinearGradient(
colors:[
Colors.purple,
Colors.teal,
],
begin:constFractionalOffset(0.0,0.4),
end:Alignment.topRight,
)
),
),
),
),
body:Center(
child:Column(
mainAxisAlignment:MainAxisAlignment.center,
children:<Widget>[
ElevatedButton(
onPressed:(){
//print('Button1pressed');
Navigator.push(
context,
MaterialPageRoute(builder:(context)=>VolunteersSignUp()));
},
child:Text('SignUpforVolunteers',style:GoogleFonts.aboreto(fontSize:16,fontWeight:FontWeight.bold),),
),
SizedBox(height:16),//Addsomespacingbetweenthebuttons
ElevatedButton(
onPressed:(){
//Codetoexecutewhenthebuttonispressed
//print('Button2pressed');
Navigator.push(
context,
MaterialPageRoute(builder:(context)=>VolunteerList()));
},
child:Text('ListofVolunteers',style:GoogleFonts.aboreto(fontSize:16,fontWeight:FontWeight.bold),),
),
SizedBox(height:16),
ElevatedButton(
onPressed:(){
//Codetoexecutewhenthebuttonispressed
//print('Button2pressed');
Navigator.push(
context,
MaterialPageRoute(builder:(context)=>ViewList()));
},
child:Text('EditDonorList',style:GoogleFonts.aboreto(fontSize:16,fontWeight:FontWeight.bold),),
),
SizedBox(height:16),
//*Addsomespacingbetweenthebuttons

 */
*/
