import 'dart:async';
import 'dart:convert';

import 'package:eventPlanning/widgets/DialogEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:eventPlanning/service.dart' as Service;

Map<String, dynamic> map;

class BeaconScan {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  BuildContext context;
  String usuario;

  BeaconScan({this.context, this.usuario}) {
    initBeacons();
    configurePush();
  }

  Future<void> initBeacons() async {
    await flutterBeacon.initializeAndCheckScanning;

    final regions = <Region>[];
    regions.add(Region(identifier: 'fda50693-a4e2-4fb1-afcf-c6eb07647825'));

    flutterBeacon.ranging(regions).listen((RangingResult result) {
      if (result != null &&
          result.beacons != null &&
          result.beacons.length > 0) {
        clickMensagemDivulgacao(result.beacons[0].proximityUUID);
      }
    });
  }

  configurePush() {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = new InitializationSettings(android: android);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String load) {
    showDialog(
        context: context,
        builder: (_) =>
            dialogEvent(map: map, context: context, usuario: usuario));
  }

  showNotification() {
    var android = new AndroidNotificationDetails('id', 'name', 'description');
    var plaftform = new NotificationDetails(android: android);

    flutterLocalNotificationsPlugin.show(
        int.parse(map['CODIGO']), map['TITULO'], map['MENSAGEM'], plaftform);
  }

  clickMensagemDivulgacao(proximityUUID) async {
    var parametros = {
      'proximityUUID': proximityUUID,
    };

    Service.post('notificacaoService/adquirirNotificacao/', parametros, null)
        .then((value) async {
      if (value != null) {
        Map<String, dynamic> dados = jsonDecode(value);

        if (dados != null && dados['CODIGO'] != null) {
          map = dados;

          showNotification();
        }
      }
    });
  }
}
