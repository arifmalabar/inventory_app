import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aplikasi_inventory/Auth/Session.dart';

class AuthModel {
  bool status = false;

  TextEditingController nama = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  Future<void> postUser() async {
    final response = await http
        .post("http://192.168.1.9/core_hmvc/auth/registerAccount", body: {
      "nama": nama.text,
      "username": email.text,
      "password": password.text
    });
    var dataUser = jsonDecode(response.body);
    if (dataUser['status'] != "register failed failed") {
      //pesanSukses();
      status = true;
    } else {
      status = false;
      //pesanGagal();
    }
  }

  void pesanGagal() {
    Fluttertoast.showToast(
        msg: "Registrasi gagal, username sudah dipakai",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void pesanSukses() {
    Fluttertoast.showToast(
        msg: "Registrasi berhasil silahkan login",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
