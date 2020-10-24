import 'package:eventPlanning/Constants.dart';
import 'package:eventPlanning/modelos/Evento.dart';
import 'package:eventPlanning/pages/PerfilPage.dart';
import 'package:eventPlanning/utils/EventList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eventPlanning/Service.dart' as Service;
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _selected = true;

  Future<List<Evento>> eventos;
  EventList eventList = new EventList();

  @override
  void initState() {
    super.initState();
    getEventos();
  }

  getEventos() async {
    setState(() {
      eventos = Service.get('eventoService/adquirirEventos/', null, null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Container(
              child: Row(
                children: [
                  Text('HOME', style: TextStyle(color: Colors.white)),
                  Padding(
                    padding: EdgeInsets.only(left: 120, right: 135),
                  ),
                  GestureDetector(
                      onTap: () {
                        clickUserButton(context);
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.brown.shade800,
                        child: Text('AH'),
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Divider(height: 10, color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
            ),
            Container(
              child: Text('AGENDA', style: TextStyle(color: Colors.white)),
            ),
            Container(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  ChoiceChip(
                    selected: _selected,
                    label: Text('PROXÍMO'),
                    backgroundColor: Colors.white,
                    avatar: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green.withOpacity(0.4)),
                      child: Center(
                          child: Icon(Icons.not_listed_location,
                              color: Colors.white)),
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        _selected = !_selected;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  ChoiceChip(
                    selected: _selected,
                    label: Text('COMPUTAÇÃO'),
                    backgroundColor: Colors.white,
                    avatar: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green.withOpacity(0.4),
                      ),
                      child: Center(
                        child: Icon(Icons.not_listed_location,
                            color: Colors.white),
                      ),
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        _selected = !_selected;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  ChoiceChip(
                    selected: _selected,
                    label: Text('FAVORITOS'),
                    backgroundColor: Colors.white,
                    avatar: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green.withOpacity(0.4),
                      ),
                      child: Center(
                        child: Icon(Icons.not_listed_location,
                            color: Colors.white),
                      ),
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        _selected = !_selected;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Divider(height: 10, color: Colors.white),
            ),
            Visibility(
              visible: _selected,
              child: Container(
                child: FutureBuilder(
                  future: eventos,
                  builder: (context, snapshort) {
                    return eventList.lista(context, snapshort);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  clickUserButton(context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: PerfilPage(),
      ),
    );
  }
}
