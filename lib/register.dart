import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Auth/AuthModel.dart';

class Register extends StatefulWidget {
  @override
  RegisterScreen createState() => RegisterScreen();
}

class RegisterScreen extends State<Register> {
  AuthModel model = new AuthModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrasi"),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: model.nama,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "nama user",
                hintText: "masukan nama anda",
                border: OutlineInputBorder(),
                icon: Icon(Icons.person),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: model.email,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "masukan email anda",
                border: OutlineInputBorder(),
                icon: Icon(Icons.email),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: model.password,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "masukan password anda",
                border: OutlineInputBorder(),
                icon: Icon(Icons.email),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                model.postUser();
                Navigator.pop(context);
              },
              child: Text("Registrasi Sekarang"),
            ),
          )
        ],
      ),
    );
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
}
