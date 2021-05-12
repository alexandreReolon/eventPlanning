import 'package:eventPlanning/constants.dart';
import 'package:flutter/material.dart';

class Carregando extends StatefulWidget {
  @override
  _CarregandoState createState() => _CarregandoState();
}

class _CarregandoState extends State<Carregando> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(CColors.COLOR_PRIMARY),
              value: controller.value,
            ),
          ],
        ),
      ),
    );
  }
}
