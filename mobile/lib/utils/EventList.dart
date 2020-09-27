import 'package:eventPlanning/components/CardEvent.dart';
import 'package:eventPlanning/modelos/Evento.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventList extends State {
  Widget lista(context, snapshot) {
    print(snapshot.data);
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        // ----------------------
        return Text("CAREGANDO"); // LOADING
        // ----------------------
        break;
      case ConnectionState.active:
      case ConnectionState.done:
        if (snapshot.data != null && !snapshot.data.isEmpty) {
          // -----------------------
          return ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              List<Evento> listaEventos = snapshot.data;
              Evento evento = listaEventos[index];

              return GestureDetector(
                onTap: () {
                  print('Hello');
                },
                child: cardEvent(
                  image: evento.image,
                  title: evento.title,
                  mes: evento.mes,
                  hour: evento.hour,
                  date: evento.date,
                ),
              );
            },
            separatorBuilder: (context, index) => Container(
              height: 10,
            ),
            itemCount: snapshot.data.length,
          );
          // -----------------------
        } else {
          // ------------------------
          return Text('Não tem dados encontrados');
          // ------------------------
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
