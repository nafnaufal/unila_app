import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        margin: EdgeInsets.all(36),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAC1EUPFN-9H2JK-et1z2hNQ_S3BiQ-AMChFpBFOoUUg&s'),
                radius: 40,
                backgroundColor: Colors.grey[800],
              ),
            ),
            Divider(height: 50, color: Colors.grey[800],),
            SizedBox(
              height: 15,
            ),
            Text(
              'Ilmu Komputer Universitas Lampung',
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
              'Akreditasi',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'A',
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
              'Fakultas',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'FMIPA',
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
            Row(
              children: [
                Icon(Icons.email, color: Colors.black),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'office@fmipa.unila.ac.id',
                  style: TextStyle(
                    color: Colors.black,
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
