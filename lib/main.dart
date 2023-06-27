import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_management/pages/food_details.dart';
import 'package:food_management/receiver_page.dart';
//import 'package:food_management/popuppage.dart';
import 'package:food_management/refridgerators.dart';
import 'package:food_management/homepage.dart';
import 'package:food_management/register.dart';
import 'package:food_management/signup_page.dart';
import 'package:food_management/startPage.dart';
import 'package:food_management/volunteer_signup.dart';
import 'package:food_management/volunteers.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'contactusPage.dart';
import 'donar_signup.dart';
import 'feedback_page.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Check whether the app is being launched for the first time or not
  SharedPreferences prefs = await SharedPreferences.getInstance();
 // bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  // Navigate to the intro page if the app is being launched for the first time
  runApp( MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      //home: SplashScreen(),
      /*home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            final SharedPreferences prefs = snapshot.data!;
            bool? showIntro = prefs.getBool("showIntro");
            if (showIntro == null) {
              showIntro = true;
            }
            if (showIntro) {
              prefs.setBool("showIntro", false);
              return IntroScreen();
            } else {
              return SplashScreen();
            }
          } else {
            return SplashScreen();
          }
        },
      ),*/
      home: SplashScreen(),
      /*FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            final SharedPreferences prefs = snapshot.data!;
            bool? showIntro = prefs.getBool("showIntro");
            if (showIntro == null) {
              showIntro = true;
            }
            if (showIntro) {
              prefs.setBool("showIntro", false);
              return IntroScreen();
            } else {
              return MyHomePage();
            }
          } else {
            return Container();
          }
        },
      )*/


      routes: {
        '/page1': (context) => HomePage(),
        '/page2': (context) => Volunteers(),
        '/page3': (context) => Refrigerators(),
        '/page4': (context) => DonarSignUpPage(),
        '/page5': (context) => RecevierPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List<IconData> _bottomNavIcons =  [
    Icons.home,
    Icons.volunteer_activism_outlined,
    Icons.kitchen,
    Icons.soup_kitchen_outlined,
    Icons.list_alt,
  ];

   List<String> _bottomNavLabels =  [
    'Home',
    'Volunteer',
    'Community Fridges',
    'Donor',
    'Items List',
  ];

   List<Widget> _pages =  [
    HomePage(),
    Volunteers(),
    Refrigerators(),
    DonarSignUpPage(),
    RecevierPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: List.generate(
          _bottomNavIcons.length,
              (index) => BottomNavigationBarItem(
            icon: Icon(_bottomNavIcons[index]),
            label: _bottomNavLabels[index],
          ),
        ),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

    );
  }
}
Future<SharedPreferences> getSharedPreferences() async {
  return await SharedPreferences.getInstance();
}



/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:SplashScreen(),
    );
  }
}*/

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    Future.delayed(const Duration(seconds:3)).then((value){
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx)=> MyHomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const[
            CircleAvatar(
              radius: 250,
              backgroundImage: AssetImage("assets/Carter One.gif"),
            ),
            SizedBox(height: 50,),
            SpinKitSquareCircle(
              color: Colors.deepOrangeAccent,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}



