import 'package:aplikasi_inventory/dashboard.dart';
import 'package:flutter/material.dart';
import 'authtenticate.dart';

void main() {
  runApp(MyApp());
}

String session_nama;
String email_session;
int session_id;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Auth(),
      routes: {
        '/home': (BuildContext context) {
          return Dashboard(
            nama: session_nama,
            email: email_session,
            id_user: session_id,
          );
        }
      },
    );
  }
}
