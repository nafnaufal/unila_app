import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:unila_app/screen/detail_student.dart';
import 'package:unila_app/screen/home.dart';
import 'package:unila_app/screen/profile.dart';
import 'screen/best_student.dart';
import 'screen/loading.dart';
import 'api/apimodel.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Splash(),
        '/load': (context) => Loading(),
        '/home': (context) => Home(),
        '/detail': (context) => DetailStudent(),
      },
      initialRoute: '/'));
}

class Splash extends StatefulWidget {
  const Splash({
    Key? key,
  }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network('http://lp3m.unila.ac.id/wp-content/uploads/2020/06/cropped-cropped-logo-unila-resmi-1.png'),
            ),
            SizedBox(
              height: 15,
            ),
            Text('Informasi Mahasiswa Ilkom'),
          ],
        ),
        nextScreen: Loading(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white);
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _index = 1;
  List<Widget> body = [
    Profile(),
    Menu(),
    BestStudent(),
  ];

  List<Color> sl = [Colors.white, Colors.black, Colors.white];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_index],
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.ease,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.transparent,
        color: Colors.lightBlueAccent,
        animationDuration: Duration(milliseconds: 250),
        index: _index,
        height: 50,
        onTap: (i) {
          setState(() {
            _index = i;
            for (var n = 0; n < 3; n++) {
              if(n == i){
                sl[n] = Colors.black;
              }else{
                sl[n] = Colors.white;;
              }
            }
          });
        },
        items: [
          Container(
            height: 40,
            child: Column(
              children: [Icon(Icons.help, color: sl[0]), Text("Ilkom")],
            ),
          ),
          Container(
            height: 40,
            child: Column(
              children: [Icon(Icons.people, color: sl[1],), Text("Mahasiswa")],
            ),
          ),
                    Container(
            height: 40,
            child: Column(
              children: [Icon(Icons.people, color: sl[2]), Text("Best IPK")],
            ),
          ),
        ],
        ),
    );
  }
}