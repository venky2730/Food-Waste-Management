
/*import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Page 1",
          body: "Introduction Page 1",
          image: Center(child: Icon(Icons.ac_unit)),
        ),
        PageViewModel(
          title: "Page 2",
          body: "Introduction Page 2",
          image: Center(child: Icon(Icons.accessibility)),
        ),
        PageViewModel(
          title: "Page 3",
          body: "Introduction Page 3",
          image: Center(child: Icon(Icons.account_balance)),
        ),
      ],
      onDone: () {
        // Navigate to the home screen after the introduction screen is done.
        Navigator.of(context).pushReplacementNamed('/home');
      },
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      showSkipButton: true,
      skip: const Text("Skip"),
      dotsFlex: 0,
      next: const Icon(Icons.arrow_forward),
      nextFlex: 0,
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'homepage.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pink.shade100,
                Colors.deepOrangeAccent.shade100,
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            )
          // color: Colors.purple[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\t\t⁕  If you have "REFUSE FOOD" click on the left button\n\n'
                  '\t\t⁕    If you have "EXCESS FOOD" click on right button',
              style: GoogleFonts.eduNswActFoundation(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    launch('https://vspca.org/tag/dog-feeding-station/');
                  },
                  child: Text('REFUSE FOOD',style: GoogleFonts.acme(fontSize: 19),),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('EXCESS FOOD',style: GoogleFonts.acme(fontSize: 19),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'main.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome 🙏🏻",
          body: "This is our small step to minimize the food wastage, we have community fridges in 20 locations at Vizag",
          image: Image.asset("assets/c3.png"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: " About Food Wastage ",
          body: "Over 30% of food is lost or wasted each year."
              " This number is even more striking, given the large number of hungry people in the world.'",
          image: Image.asset("assets/f3.jpg"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Get started",
          body: "Get started and start using our app.",
          image: Image.asset("assets/main icon.png"),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => MyApp()),
      ),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      dotsDecorator: const DotsDecorator(
        activeColor: Colors.deepOrange,
        size: Size(10.0, 10.0),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

