import 'dart:async';
import 'dart:convert';

import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/pages/BeaconScan.dart';
import 'package:eventPlanning/pages/EventoParticipante.dart';
import 'package:eventPlanning/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eventPlanning/service.dart' as Service;

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

    configurePage();
    super.initState();
  }

  configurePage() {
    pages = [HomePage(), EventoParticipante()];

    items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.event),
        label: 'Eventos',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.event),
        label: 'Participando',
      ),
    ];

    currentPage = pages[0];
  }

  getUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    usuario = prefs.getString('usuario');

    BeaconScan(usuario: usuario, context: context);
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
