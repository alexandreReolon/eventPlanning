import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/models/Event.dart';
import 'package:flutter/material.dart';
import 'package:eventPlanning/service.dart' as Service;

class EventoParticipante extends StatefulWidget {
  EventoParticipante({Key key}) : super(key: key);

  _EventoParticipante createState() => _EventoParticipante();
}

class _EventoParticipante extends State<EventoParticipante> {
  Future<List<Event>> eventos;

  @override
  Widget build(BuildContext context) {
    getEventos() async {
      setState(() {
        eventos = Service.getEvento(context);
      });
    }

    @override
    void initState() {
      super.initState();
      getEventos();
    }

    return Scaffold(
      backgroundColor: CColors.BACKGROUND_COLOR_DARK,
      body: SafeArea(
        child: FutureBuilder(
          future: eventos,
          builder: (context, snapshort) {
            return ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) => Container(
                height: 10,
              ),
              itemBuilder: (context, index) {
                return SizedBox(); //CardEvent(context: context);
              },
            );
          },
        ),
      ),
    );
  }
}
