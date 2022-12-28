import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:unila_app/api/datamodel.dart';

class DetailStudent extends StatelessWidget {
  const DetailStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final DataMahasiswa data =
        ModalRoute.of(context)?.settings.arguments as DataMahasiswa;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Detail Student"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Card(
          margin: EdgeInsets.all(36),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Nama',
                style: TextStyle(
                  color: Colors.black87,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                data.nama_mahasiswa,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Periode masuk',
                style: TextStyle(
                  color: Colors.black87,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                data.periode_masuk,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  letterSpacing: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Semester Sekarang',
                style: TextStyle(
                  color: Colors.black87,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                data.semester_sekarang,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  letterSpacing: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Total SKS',
                style: TextStyle(
                  color: Colors.black87,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                data.total_sks,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  letterSpacing: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'IPK',
                style: TextStyle(
                  color: Colors.black87,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                data.ipk,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  letterSpacing: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.question_mark_rounded, color: Colors.black87),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    data.status,
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
      ),
    );
  }
}
