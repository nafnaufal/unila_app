import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/apimodel.dart';
import '../api/datamodel.dart';

class BestStudent extends StatefulWidget {
  const BestStudent({super.key});

  @override
  State<BestStudent> createState() => _BestStudentState();
}

class _BestStudentState extends State<BestStudent> {
  
  DataMahasiswa? data;

  late bool prefExists;

  int? d = 1;

  void updateData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();

    ApiModel best =
        new ApiModel(idProdi: "54BBD27B-2376-4CAE-9951-76EF54BD2CA2");
    await best.getBest().then((value) {
        setState(() {
          data = value;
        });
    });
    setData();
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("id_peserta_didik")){
      final id_peserta_didik = await prefs.getString("id_peserta_didik");
      final id_reg_pd = await prefs.getString("id_reg_pd");
      final program_studi = await prefs.getString("program_studi");
      final npm = await prefs.getString("npm");
      final nama_mahasiswa = await prefs.getString("nama_mahasiswa");
      final id_prodi = await prefs.getString("id_prodi");
      final periode_masuk = await prefs.getString("periode_masuk");
      final semester_sekarang = await prefs.getString("semester_sekarang");
      final ips = await prefs.getString("ips");
      final ipk = await prefs.getString("ipk");
      final total_sks = await prefs.getString("total_sks");
      final status = await prefs.getString("status");

      DataMahasiswa? temp = new DataMahasiswa(id_peserta_didik!, id_reg_pd!, program_studi!, npm!, nama_mahasiswa!, id_prodi!, periode_masuk!, semester_sekarang!, ips!, ipk!, total_sks!, status!);
      setState(() {      
        data = temp;
      });
      print("tr");
    }else{
      print("fa");
      updateData();
    }
  }
  void setData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("id_peserta_didik", data!.id_peserta_didik);
    await prefs.setString("id_reg_pd", data!.id_reg_pd);
    await prefs.setString("program_studi", data!.program_studi);
    await prefs.setString("npm", data!.npm);
    await prefs.setString("nama_mahasiswa", data!.nama_mahasiswa);
    await prefs.setString("id_prodi", data!.id_prodi);
    await prefs.setString("periode_masuk", data!.periode_masuk);
    await prefs.setString("semester_sekarang", data!.semester_sekarang);
    await prefs.setString("ips", data!.ips);
    await prefs.setString("ipk", data!.ipk);
    await prefs.setString("total_sks", data!.total_sks);
    await prefs.setString("status", data!.status);
  }

  @override
  void initState() {
    super.initState();
    getData(); 
    print("real $d");
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            data = null;
            updateData();
          });
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.sync),
      ),
      body: SafeArea(
        child: Card(
          margin: EdgeInsets.all(36),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
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
                            Icon(Icons.question_mark_rounded, color: Colors.black87),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${data?.status}",
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
