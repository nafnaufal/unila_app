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
      title: 'Clean Code',
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
            Text('Unila App'),
          ],
        ),
        nextScreen: Loading(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.blue);
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
          });
        },
        items: [
          Icon(Icons.help),
          Icon(Icons.home),
          Icon(Icons.star, color: Colors.amber,),
        ],
        ),
    );
  }
}