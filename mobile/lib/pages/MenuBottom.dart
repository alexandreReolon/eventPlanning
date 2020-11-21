import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/pages/CadastroEventoPage.dart';
import 'package:eventPlanning/pages/DashboardPage.dart';
import 'package:eventPlanning/pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuBottom extends StatefulWidget {
  @override
  _MenuBottomState createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {
  List<Widget> pages;
  Widget currentPage;
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    pages = [HomePage(), CadastroEventoPage(), DashBoardPage()];
    currentPage = pages[0];

    super.initState();
  }

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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text('Eventos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_available),
            title: Text("Cadastro Evento"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_available),
            title: Text("DashBoard"),
          ),
        ],
      ),
    );
  }
}
