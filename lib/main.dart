import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:unila_app/screen/home.dart';
import 'screen/best_student.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Clean Code',
      home: AnimatedSplashScreen(
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
          nextScreen: Home(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.leftToRight,
          backgroundColor: Colors.blue)));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _index = 1;
  List<Widget> body = [
    Icon(Icons.save),
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
          Icon(Icons.save),
          Icon(Icons.home),
          Icon(Icons.star, color: Colors.amber,),
        ],
        ),
    );
  }
}