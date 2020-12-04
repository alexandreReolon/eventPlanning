import 'package:eventPlanning/pages/LoginPage.dart';
import 'package:eventPlanning/pages/MenuBottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

String logado;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  logado = prefs.getString('user');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();

    initBeacons();
    configurePush();
  }

  Future<void> initBeacons() async {
    await flutterBeacon.initializeAndCheckScanning;

    final regions = <Region>[];
    regions.add(Region(identifier: 'fda50693-a4e2-4fb1-afcf-c6eb07647825'));

    flutterBeacon.ranging(regions).listen((RangingResult result) {
      if (result != null &&
          mounted &&
          result.beacons != null &&
          result.beacons.length > 0) {
        showNotification();
      }
    });
  }

  configurePush() {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = new InitializationSettings(android: android);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String load) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: new Text("TESTANDO PUSH"),
              content: new Text('$load'),
            ));
  }

  showNotification() {
    var android = new AndroidNotificationDetails('id', 'name', 'description');
    var plaftform = new NotificationDetails(android: android);

    flutterLocalNotificationsPlugin.show(
        0, "Apresentando", "mensagem de divulgação do evento", plaftform);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: logado != null ? MenuBottom() : LoginPage());
  }
}
