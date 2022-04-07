import 'dart:convert';

import 'package:aplikasi_inventory/Auth/Session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Auth/AuthModel.dart';
import 'main.dart';

import 'package:http/http.dart' as http;
import 'register.dart';

class Auth extends StatefulWidget {
  @override
  LoginScreen createState() => LoginScreen();
}

class LoginScreen extends State<Auth> {
  @override
  String msg = "";
  AuthModel model = new AuthModel();
  Session sess = new Session();
  var session = FlutterSession();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  Future<void> Authenticate() async {
    final response = await http.post(
        "http://192.168.1.9/core_hmvc/auth/authValidator",
        body: {"username": email.text, "password": password.text});
    final data = jsonDecode(response.body);
    print(data);
    if (data['status'] != "failed to login username password keliru") {
      setState(() {
        session_nama = data['nama'];
        session = data;
      });
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        msg = "username passwrod anda salah";
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: ListView(
          children: [
            Container(
              height: 200.0,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Masukan Username anda", labelText: "username"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Masukan Password anda", labelText: "password"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, bottom: 15),
              child: Row(
                children: [
                  Text("belum memiliki akun? "),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return Register();
                        }),
                      );
                    },
                    child: Text(
                      "registrasi",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Authenticate();
                },
                child: Text("Login"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(this.msg, style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    ));
  }

  void tampil() {
    Fluttertoast.showToast(
        msg: "LOGIN GAGAL",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
