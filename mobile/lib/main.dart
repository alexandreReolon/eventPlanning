import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/components/menu.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/LoginPage.dart';

void main() async {
  String logado = "null"; //TODO buscar do bd

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MaterialApp(
    home: (logado != null) ? MyHomePage() : LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}
