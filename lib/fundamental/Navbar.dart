import 'package:flutter/material.dart';
import 'package:aplikasi_inventory/dashboard.dart';

class Navbar extends StatelessWidget {
  String email;
  String nama;
  Navbar({this.nama, this.email});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(nama), accountEmail: Text("orang@gmail.com")),
          ListTile(
            title: Text("Item1"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text("Item1"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text("Item1"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
