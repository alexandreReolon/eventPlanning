import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eventPlanning/pages/HomePage.dart';
import 'package:eventPlanning/pages/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SharedPreferences prefs = await SharedPreferences.getInstance();

  String logado = prefs.getString('counter');

  runApp(MaterialApp(
    home: (logado != null) ? HomePage() : LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}
