import 'dart:convert';

import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/pages/CadastroEventoPage.dart';
import 'package:eventPlanning/pages/DashboardPage.dart';
import 'package:eventPlanning/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

String usuario;
List<Widget> pages;
Widget currentPage;
int currentTab = 0;
List<BottomNavigationBarItem> items;

final PageStorageBucket bucket = PageStorageBucket();

class MenuBottom extends StatefulWidget {
  @override
  MenuBottomState createState() => MenuBottomState();
}

class MenuBottomState extends State<MenuBottom> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    getUsuario();

    initBeacons();
    configurePush();
    configurePage();
    super.initState();
  }

  configurePage() {
    pages = [
      HomePage(),
      DashBoardPage(),
    ];

    items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.event),
        label: 'Eventos',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.event_available),
        label: " DashBoard",
      ),
    ];

    var jsonString = jsonDecode(usuario);

    Map<String, dynamic> user = jsonDecode(jsonString);

    if (user['codigoTipoUsuario'] == CTipoUsuario.ADMINISTRADOR) {
      pages.add(CadastroEventoPage());

      items.add(BottomNavigationBarItem(
        icon: Icon(Icons.event_available),
        label: "Cadastro Evento",
      ));
    }

    currentPage = pages[0];
  }

  getUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    usuario = prefs.getString('usuario');
  }

  Future<void> initBeacons() async {
    await flutterBeacon.initializeAndCheckScanning;

    final regions = <Region>[];
    regions.add(Region(identifier: 'fda50693-a4e2-4fb1-afcf-c6eb07647825'));

    flutterBeacon.ranging(regions).listen((RangingResult result) {
      if (result != null && mounted && result.beacons != null) {
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
    return Scaffold(
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff01405F),
        unselectedItemColor: CColors.TEXT_COLOR,
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: items,
      ),
    );
  }
}
