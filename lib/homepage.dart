import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:food_management/receiver_page.dart';
import 'package:food_management/refridgerators.dart';
import 'package:food_management/volunteers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'How_to_use_app.dart';
import 'aboutusPage.dart';
import 'contactusPage.dart';
import 'donar_signup.dart';
import 'feedback_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';
import 'package:better_player/better_player.dart';

//0XFF61876E,OXFF3C6255
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override

  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video.mp4');
    _controller.addListener(() {
      if (_controller.value.isPlaying) {
        setState(() {
          _isPlaying = true;
        });
      } else {
        setState(() {
          _isPlaying = false;
        });
      }
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _toggleVideoPlaying() {
    setState(() {
      if (_isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                 // Color(0xFFFCE38A),
                  //Color( 0xFFF38181),
                  Color(0xFF184E68),
                  Color(0xFF57CA85),

                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Text("LET'S FRIDGE IT", style: GoogleFonts.acme(fontSize: 40, color: Colors.white,),),
         //backgroundColor: Colors.amber.shade800,
        ),
        body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:15),
            child: Container(
             //color: Color(0xFF6c0c44),
             //color: Color(0XFF0c446c),
              color: Color(0XFF94AF9F),
              height: 440,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: '\t\t\t\tFOOD WASTAGE IN INDIA \n',
                    style:GoogleFonts.arvo(fontSize: 25, color: Colors.white,),
                    children: <TextSpan>[
                      TextSpan(
                        text:'\n\t\t\tAccording to the UNITED NATIONS ENVIRONMENT PROGRAMME food wastage index report, approximately 68,760,163 tonnes of food is wasted annually in Indian homes. It amounts to 40% of the food produced in India is wasted. The value of the food is around 92,000 crore rupees per annul. '
                            ' An Indian household on an average wastes 50kg of food every year'
                           'We waste not only the food itself, but also the water and energy to grow, harvest, transport and packing it.  Additionally, rotting foods in landfills releases methane, an even more potent greenhouse gas than carbon dioxide.',
                        style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),//About FOOd wastage
            ),
          ),
          SizedBox(height: 20,),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: [
              'assets/f1.jpg',
              'assets/f2.jpg',
              'assets/f3.jpg',
              'assets/f4.jpg',
              'assets/f6.jpg',
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.asset(i, fit: BoxFit.cover),
                  );
                },
              );
            }).toList(),
          ),//Images
            SizedBox(height: 40),
          Container(
           // color: Color(0XFF446c0c),
           // color: Color(0XFF0c446c),
          //  color: Color(0xFF6c0c44),
            color: Color(0XFFDBE4C6),
            height: 760,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: '\t\t\t\t\t\t\t\tCOMMUNITY FRIDGES',
                  style: GoogleFonts.arvo(fontSize: 25,color: Colors.black),
                  children: <TextSpan>[
                  TextSpan(
                    text:'\n\n\t\t\tCommunity fridges are refrigerators that are set up in public spaces, such as on the sidewalk outside a community centre or in a park, where anyone can access them to take or donate food. These fridges are typically stocked with surplus food that is donated by individuals,businesses,and local organisations, and the goal is to provide free and accessible food to those who need it.'
                  '\tCommunity fridges have become increasingly popular in recent years as a way to address food insecurity and reduce food waste. They provide a simple and practical solution for redistributing excess food that might otherwise go to waste, while also helping to ensure that those who are struggling to make ends meet have access to healthy and nutritious food.'
                '\tIn addition to providing food to those in need, community fridges can also help to foster a sense of community and encourage local engagement. They provide an opportunity for individuals and organisations to come together to address a shared problem, and can serve as a focal point for community events and initiatives.',
                    style: GoogleFonts.roboto(fontSize: 20,color: Colors.black,),
                  ),
                ],
                ),
              ),
            ),

          ),//CF----
          SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  GestureDetector(
                    onTap: _toggleVideoPlaying,
                    child: Container(
                      color: Colors.transparent,
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ),

          SizedBox(height: 20,),
         /* Container(
           // color: Color(0xFF6c0c44),
            //color: Color(0XFF0c446c),
            color: Color(0XFFD3756B),
            height: 320,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: RichText(
                text: TextSpan(
                  text: 'Our Vision\n',
                  style:GoogleFonts.eduNswActFoundation(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,),
                  children: <TextSpan>[
                    TextSpan(
                      text:'\n\n Our main Vision in order to reduce food wastage is that we have community fridges'
                           'we have started this at  Vizag in 20 locations and in future we want our vision to spread all over our country.',
                      style: GoogleFonts.dosis(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),

            ),
          ),*/
          SizedBox(height: 20,),//Our Vision--
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Container(
              color: Color(0XFF61876E),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'JOIN US',
                      style: GoogleFonts.alatsi(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Navigate to volunteers page
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Volunteers()));
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
     // color: Color(0XFF6FD6FF),
      //color: Color(0XFF0c446c),
           color: Color(0xFFA75D5D),
             height:700,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n\n',
                      ),
                      TextSpan(
                        text: 'INTERNATIONAL VAISH FEDERATION (A.P)',
                        style: GoogleFonts.arvo(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: '\n\nThe international Vaish federation is a non-profit organisation that represents the interests of vaish community and serves the needs of society in general. The international vaish community aims to promote and preserve the cultural, social and economic heritage of our country. Some of the activities of the international Vaish federation include organizing conferences, seminars and workshops on topics related to business and entrepreneurship, promoting education and vocational training, and supporting social welfare initiatives. Since one year international vaish federation- Andhra Pradesh unit is trying to educate the people not to waste food. As a part of this social program, they established twenty community fridges in various locations in Visakhapatnam city. The proposed application not only helps the organization in collecting the waste food but also creates awareness in the area of food wastage.',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )

          ),//Federation--
          SizedBox(height: 45),
          Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
    'Images of Community Fridges',
    style: GoogleFonts.arvo(fontSize: 30,color: Colors.black),
    ),
    ),
         SizedBox(height: 10),
          Container(
      child: CarouselSlider(
      options: CarouselOptions(
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      ),
      items: [
      'assets/c1.jpg',
        'assets/c2.jpg',
        'assets/c3.png',
        'assets/c4.png',
        'assets/c5.png',
      ].map((i) {
      return Builder(
      builder: (BuildContext context) {
      return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
      color: Colors.white,
      ),
      child: Image.asset(i, fit: BoxFit.cover),
      );
      },
      );
      }).toList(),
      ),
    ),//Images
        ],
        ),

        ),
      drawer: Drawer(
    backgroundColor: Colors.white,

      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Queries',style: GoogleFonts.arvo(fontSize: 45,color: Colors.white),),
            decoration: BoxDecoration(
              color: Color(0XFF4E6C50),
            ),
          ),
          ListTile(
            title: Text('How it works',style: GoogleFonts.arvo(fontSize: 25),),
            onTap: () {
              // Do something when the first item is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HowToUsAppPage()),
              );
            },
          ),
          ListTile(
            title: Text('Feedback',style: GoogleFonts.arvo(fontSize: 25),),
            onTap: () {
              // Do something when the second item is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackPage()),
              );
            },
          ),
          ListTile(
            title: Text('About Us',style: GoogleFonts.arvo(fontSize: 25),),
            onTap: () {
              // Do something when the third item is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutusPage()),
              );
            },
          ),
          ListTile(
            title: Text('Contact Us',style: GoogleFonts.arvo(fontSize: 25),),
            onTap: () {
              // Do something when the third item is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUsPage()),
              );
            },
          ),
        ],
      ),
    ),
    );
  }
}

