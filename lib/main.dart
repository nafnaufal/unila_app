import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'screen/best_student.dart';

void main() {
  runApp(MaterialApp(
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
    Icon(Icons.home),
    Icon(Icons.menu),
    BestStudent(),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) {
          setState(() {
            _index = i;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Menu', icon: Icon(Icons.menu)),
          BottomNavigationBarItem(label: 'Lulusan Terbaik', icon: Icon(Icons.person)),
        ],
        ),
    );
  }
}