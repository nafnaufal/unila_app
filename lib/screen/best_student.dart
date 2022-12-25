import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/apimodel.dart';
import '../api/datamodel.dart';

class BestStudent extends StatefulWidget {
  const BestStudent({super.key});

  @override
  State<BestStudent> createState() => _BestStudentState();
}

DataMahasiswa? data;

class _BestStudentState extends State<BestStudent> {
  setupApi() async {
    ApiModel best =
        new ApiModel(idProdi: "54BBD27B-2376-4CAE-9951-76EF54BD2CA2");
    await best.getBest().then((value) {
      if(data == null) {
        setState(() {
          data = value;
        });
      }
    });
  }

  // Future<DataMahasiswa?> _getBestFromSP() async {
  //   final pref = await SharedPreferences.getInstance();
  //   final mahasiswa = pref.get('best');
  //   if(mahasiswa == null) {
  //     return null;
  //   }
  //   return mahasiswa;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        margin: EdgeInsets.all(36),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: data == null
              ? const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 40),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text(
                        'IPK Tertinggi',
                        style: TextStyle(
                          color: Colors.black87,
                          letterSpacing: 2,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        height: 50,
                        color: Colors.grey[800],
                      ),
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
                        "${data?.nama_mahasiswa}",
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
                        "${data?.periode_masuk}",
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
                        "${data?.semester_sekarang}",
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
                        "${data?.total_sks}",
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
                        "${data?.ipk}",
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_box, color: Colors.black87),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Aktif',
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
