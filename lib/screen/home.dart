import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:unila_app/api/datamodel.dart';
import '../api/apimodel.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Map firstdata = {};
  List<DataMahasiswa> data = [];

  int _page = 2;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true;
      });

      _page += 1;

      try {
        final ApiModel res =
            new ApiModel(idProdi: "54BBD27B-2376-4CAE-9951-76EF54BD2CA2");
        await res.getData(_page).then((value) {
          if (value.isNotEmpty) {
            setState(() {
              this.data.addAll(value);
            });
          } else {
            setState(() {
              _hasNextPage = false;
            });
          }
        });
      } catch (e) {
        print('Connection Failed');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  late ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  Widget build(BuildContext context) {
    firstdata = ModalRoute.of(context)?.settings.arguments as Map;
    data.addAll(firstdata["data"]);
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Data Mahasiswa',
            style: TextStyle(
              color: Colors.black87,
              letterSpacing: 2,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(
          height: 2,
          color: Colors.grey[800],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: data == null ? 0 : data.length,
              controller: _controller,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(data[index].nama_mahasiswa),
                    subtitle: Text(data[index].npm),
                    onTap: () {
                      Navigator.pushNamed(context, '/detail',
                          arguments: data[index]);
                      // print("object");
                    },
                  ),
                );
              }),
        ),
        if (_isLoadMoreRunning == true)
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 40),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        if (_hasNextPage == false)
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 40),
            color: Colors.blue,
            child: const Center(
              child: Text('No more data!'),
            ),
          ),
      ],
    ));
  }
}
