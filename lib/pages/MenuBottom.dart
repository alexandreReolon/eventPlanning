import 'dart:convert';

import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/pages/BeaconScan.dart';
import 'package:eventPlanning/pages/EventoParticipante.dart';
import 'package:eventPlanning/pages/HomePage.dart';
import 'package:eventPlanning/pages/FeedbackPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String usuario;
List<Widget> pages;
Widget currentPage;
int currentTab;
List<BottomNavigationBarItem> items;

PageStorageBucket bucket = new PageStorageBucket();

class MenuBottom extends StatefulWidget {
  @override
  MenuBottomState createState() => MenuBottomState();
}

class MenuBottomState extends State<MenuBottom> {
  @override
  void initState() {
    getUsuario();

    super.initState();
  }

  configurePage() {
    Map<String, dynamic> dadosUsuario = jsonDecode(usuario);

    pages = [
      HomePage(dadosUsuario: dadosUsuario),
      EventoParticipante(dadosUsuario: dadosUsuario),
      FeedbackPage(dadosUsuario: dadosUsuario),
    ];

    items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.event),
        label: 'Eventos',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.event_available),
        label: 'Participando',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.feedback),
        label: 'Pesquisa',
      ),
    ];

    currentPage = pages[0];
    currentTab = 0;
  }

  getUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      usuario = prefs.getString('usuario');
    });

    BeaconScan(usuario: usuario, context: context);

    configurePage();
  }

  @override
  Widget build(BuildContext context) {
    return usuario != null
        ? Scaffold(
            body: PageStorage(
              child: currentPage,
              bucket: bucket,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xff01405F),
              unselectedItemColor: CColors.nearlyWhite,
              selectedItemColor: CColors.COLOR_PRIMARY,
              currentIndex: currentTab,
              onTap: (int index) {
                setState(() {
                  currentTab = index;
                  currentPage = pages[index];
                });
              },
              items: items,
            ),
          )
        : Container();
  }
}
