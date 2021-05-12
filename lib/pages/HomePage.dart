import 'dart:async';
import 'dart:convert';

import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/models/Event.dart';
import 'package:eventPlanning/widgets/Carregando.dart';
import 'package:eventPlanning/widgets/NaoHaDados.dart';
import 'package:eventPlanning/widgets/card_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eventPlanning/service.dart' as Service;

class HomePage extends StatefulWidget {
  final Map<String, dynamic> dadosUsuario;

  HomePage({Key key, this.dadosUsuario}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Future<List<Event>> eventos;
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    getData();

    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval((1 / 10) * 1, 1.0, curve: Curves.fastOutSlowIn)));
    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            backgroundColor: CColors.BACKGROUND_COLOR_DARK,
            body: Column(children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              const SizedBox(
                height: 16,
              ),
              getToolbar(),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Eventos disponíveis',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      letterSpacing: 0.27,
                      color: CColors.nearlyWhite,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                          height: MediaQuery.of(context).size.height - 250,
                          child: Column(children: <Widget>[
                            Flexible(
                              child: getListEvent(),
                            ),
                          ]))))
            ])));
  }

  Widget getListEvent() {
    return Padding(
        padding: EdgeInsets.only(top: 8.0, left: 18, right: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Flexible(
              child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: FutureBuilder(
                      future: eventos,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Carregando();
                        }

                        if (!snapshot.hasData || snapshot.data.isEmpty) {
                          return naoHaDados();
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
                                  ),
                                );
                              });
                        }
                      })))
        ]));
  }

  Widget getToolbar() {
    var nomeUsuario = widget.dadosUsuario['nomeUsuario'];

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
            opacity: animation,
            child: Transform(
                transform: Matrix4.translationValues(
                    100 * (1.0 - animation.value), 0.0, 0.0),
                child: InkWell(
                    splashColor: Colors.transparent,
                    child: SizedBox(
                        height: 100,
                        child: Stack(children: <Widget>[
                          Container(
                              child: Row(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 16, left: 15),
                                child: Expanded(
                                    child: Column(children: <Widget>[
                                  Text(
                                    'Bem vindo,',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      letterSpacing: 0.2,
                                      color: CColors.TEXT_COLOR,
                                    ),
                                  ),
                                  Text(
                                    '${nomeUsuario}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      letterSpacing: 0.27,
                                      color: CColors.nearlyWhite,
                                    ),
                                  )
                                ])))
                          ]))
                        ])))));
      },
    );
  }

  getData() async {
    setState(() {
      eventos = Service.getEvento(context);
    });
  }
}
