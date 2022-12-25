import 'package:flutter/material.dart';
import '../api/apimodel.dart';
import '../api/datamodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  setupApi() async {
    List<DataMahasiswa> datas = [];
    ApiModel data =
        new ApiModel(idProdi: "54BBD27B-2376-4CAE-9951-76EF54BD2CA2");
    await data.getData(1).then((value) => datas.addAll(value));
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'data': datas,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitPulse(
            color: Colors.blueGrey,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
