import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../api/api.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {




  setupApi() async {
    DataModel data =
        new DataModel(page: 1, idProdi: "54BBD27B-2376-4CAE-9951-76EF54BD2CA2");
    await data.getData().then((value) => print(value["data"]));
  }

  @override
  void initState() {
    super.initState();
    setupApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Card(
      child: ListTile(
        title: Text('Test'),
        onTap: () {},
      ),
    ));
  }
}
