import 'package:eventPlanning/animations/FadeAnimation.dart';
import 'package:eventPlanning/components/cardEvent.dart';
import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/modelos/Evento.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventList extends State {
  Widget lista(context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Text("CAREGANDO");
    }
    if (snapshot.hasData && !snapshot.data.isEmpty) {
      return renderizarEventos(snapshot.data);
    } else {
      return renderizarNaoHaDados();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget renderizarEventos(data) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        Evento evento = data[index];

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
      itemCount: data.length,
    );
  }

  Widget renderizarNaoHaDados() {
    return FadeAnimation(
        1.8,
        Container(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 150,
                  width: 150,
                  child: FlareActor(
                    "assets/animations/calendario.flr",
                    animation: "calendario",
                    fit: BoxFit.fill,
                  )),
              Text(
                "Ops, Nenhum evento cadastrado, volte mais tarde.",
                style: TextStyle(
                  fontSize: 18.0,
                  color: CColors.TEXT_COLOR,
                ),
              ),
            ],
          ),
        ));
  }
}
