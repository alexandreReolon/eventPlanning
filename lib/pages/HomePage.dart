import 'dart:async';

import 'package:eventPlanning/animations/FadeAnimation.dart';
import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/models/Event.dart';
import 'package:eventPlanning/widgets/button_filter.dart';
import 'package:eventPlanning/widgets/card_view.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eventPlanning/service.dart' as Service;

int categoryType = Category.DIVERSOS;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Future<List<Event>> eventos;

  @override
  void initState() {
    getData();

    super.initState();
  }

  getData() async {
    setState(() {
      eventos = Service.getEvento('eventoService/adquirirEventos/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: CColors.BACKGROUND_COLOR_DARK,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getToolbar(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      getCategory(),
                      Flexible(
                        child: getListEvent(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getToolbar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Bem vindo,',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: CColors.TEXT_COLOR,
                  ),
                ),
                Text(
                  'Alexandre',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color: CColors.nearlyWhite,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/images/event.jpg'),
          ),
        ],
      ),
    );
  }

  Widget getCategory() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'Categorias',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: CColors.nearlyWhite,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              buttonFilter(
                txt: "DIVERSOS",
                valueField: Category.DIVERSOS,
                value: categoryType,
                onclick: clickButtonFilter,
              ),
              const SizedBox(
                width: 16,
              ),
              buttonFilter(
                txt: "TECNOLOGIA",
                valueField: Category.TECNOLOGIA,
                value: categoryType,
                onclick: clickButtonFilter,
              ),
              const SizedBox(
                width: 16,
              ),
              buttonFilter(
                txt: "MUSICA",
                valueField: Category.MUSICA,
                value: categoryType,
                onclick: clickButtonFilter,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  clickButtonFilter(value) {
    setState(() {
      categoryType = value;

      eventos = Service.getEvento('eventoService/adquirirEventos/');
    });
  }

  Widget getListEvent() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Eventos Disponíveis',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: CColors.nearlyWhite,
            ),
          ),
          Flexible(
              child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: FutureBuilder(
              future: eventos,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return renderizarCarregando();
                }

                if (!snapshot.hasData || snapshot.data.isEmpty) {
                  return renderizarNaoHaDados();
                } else {
                  var data = snapshot.data;

                  return ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: data.length,
                    separatorBuilder: (context, index) => Container(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            print('Hello');
                          },
                          child: CardView(
                            event: snapshot.data[index],
                          ));
                    },
                  );
                }
              },
            ),
          ))
        ],
      ),
    );
  }

  Widget renderizarNaoHaDados() {
    return FadeAnimation(
        1.8,
        Container(
          padding: EdgeInsets.only(left: 25, right: 25, top: 50),
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

  Widget renderizarCarregando() {
    return Container();
  }
}
