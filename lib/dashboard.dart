import 'package:aplikasi_inventory/Auth/Session.dart';
import 'package:aplikasi_inventory/barang.dart';
import 'package:aplikasi_inventory/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
//import 'fundamental/BottomNav.dart';
import 'fundamental/Navbar.dart';

class Dashboard extends StatefulWidget {
  Dashboard({this.nama, this.email, this.id_user});
  final String email;
  final int id_user;
  final String nama;
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  Session sess = new Session();

  final List<Widget> pages = [
    Container(
      child: Text("12"),
    ),
    Container(
      child: HomeApp(),
    )
  ];
  int _selectedNavbar = 0;
  void _setValue(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("dashboard"),
      )),
      body: pages.elementAt(_selectedNavbar),
      bottomNavigationBar: BottomNav(),
      drawer: Navbar(
        nama: widget.nama,
        email: widget.email,
      ),
    );
  }

  Widget BottomNav() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Barang'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
      ],
      currentIndex: _selectedNavbar,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      onTap: _setValue,
    );
  }
}
