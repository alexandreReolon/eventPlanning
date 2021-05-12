import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/models/Event.dart';
import 'package:eventPlanning/widgets/Carregando.dart';
import 'package:eventPlanning/widgets/NaoHaDados.dart';
import 'package:eventPlanning/widgets/PainelHoras.dart';
import 'package:eventPlanning/widgets/card_view.dart';
import 'package:eventPlanning/service.dart' as Service;
import 'package:flutter/material.dart';

class EventoParticipante extends StatefulWidget {
  final Map<String, dynamic> dadosUsuario;

  EventoParticipante({Key key, this.dadosUsuario}) : super(key: key);

  _EventoParticipante createState() => _EventoParticipante();
}

class _EventoParticipante extends State<EventoParticipante>
    with TickerProviderStateMixin {
  Future<List<Event>> eventos;
  AnimationController animationController;
  Animation<double> animation;
  int codigoUsuario;

  @override
  void initState() {
    getData();
    super.initState();

    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval((1 / 10) * 1, 1.0, curve: Curves.fastOutSlowIn)));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
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
            PainelHora(
              animation: animation,
              animationController: animationController,
              usuario: widget.dadosUsuario,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Text(
                  'Eventos já realizado',
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
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
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

  Widget getListEvent() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
              child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: FutureBuilder(
              future: eventos,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
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

  getData() async {
    var dados = widget.dadosUsuario;
    var parametros = {'codigoUsuario': dados['codigoUsuario']};

    setState(() {
      eventos = Service.getEventosRealizados(context, parametros);
    });
  }
}
