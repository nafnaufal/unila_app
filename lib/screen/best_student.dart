import 'package:flutter/material.dart';

class BestStudent extends StatelessWidget {
  const BestStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Card(
            margin: EdgeInsets.all(36),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Lulusan Terbaik Semester Ini',
                        style: TextStyle(
                          color: Colors.black87,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    Divider(
                      height: 50,
                      color: Colors.grey[800],
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/01/12/9059850.jpg'),
                        radius: 40,
                        backgroundColor: Colors.grey[800],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Nama',
                      style: TextStyle(
                        color: Colors.black87,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Naufal Anbial Falah',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        letterSpacing: 2,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Skills Level',
                      style: TextStyle(
                        color: Colors.black87,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '3,4',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        letterSpacing: 2,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(Icons.email, color: Colors.black87),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'naufalanbial@gmail.com',
                          style: TextStyle(
                            color: Colors.black87,
                            letterSpacing: 2,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        );
  }
}
