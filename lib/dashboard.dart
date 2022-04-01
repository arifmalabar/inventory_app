import 'package:aplikasi_inventory/barang.dart';
import 'package:aplikasi_inventory/main.dart';
import 'package:flutter/material.dart';
//import 'fundamental/BottomNav.dart';
import 'fundamental/Navbar.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}
class DashboardState extends State<Dashboard> {
  final List<Widget> pages = [
    Container(
      child: Text("oke"),
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
          child: Text("inventory App"),
        )
      ),
      body: pages.elementAt(_selectedNavbar),
      bottomNavigationBar: BottomNav(),
      drawer: Navbar(),
    );
  }
  Widget BottomNav()
  {
    
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note),
          label: 'Barang'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account'
        )
      ],
      currentIndex: _selectedNavbar,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      onTap: _setValue,
    );
  } 
}