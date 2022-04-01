import 'dart:async';
import 'dart:convert';

import 'package:aplikasi_inventory/dashboard.dart';
import 'package:aplikasi_inventory/fundamental/Navbar.dart';
import 'package:flutter/material.dart';
import 'tambah.dart';
import 'edit.dart';
import 'barang.dart';
import 'server/Model.dart';
import 'fundamental/BottomNav.dart';
import 'fundamental/BottomNav.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      theme: ThemeData(primarySwatch: Colors.green),
      home: Dashboard(),
    );
  }
}


