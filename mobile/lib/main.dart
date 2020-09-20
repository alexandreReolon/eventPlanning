import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eventPlanning/pages/HomePage.dart';
import 'package:eventPlanning/pages/LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  String logado = null;

  runApp(MaterialApp(
    home: (logado != null) ? HomePage() : LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}
