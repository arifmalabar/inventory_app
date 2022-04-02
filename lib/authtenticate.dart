import 'package:flutter/material.dart';
import 'register.dart';

class Auth extends StatefulWidget {
  @override
  LoginScreen createState() => LoginScreen();
}

class LoginScreen extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
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
                //controller: ,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Masukan Username anda", labelText: "username"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                //controller: ,
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
                onPressed: () {},
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
