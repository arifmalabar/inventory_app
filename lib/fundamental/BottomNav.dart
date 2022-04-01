import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  BottomState createState() => BottomState();
}

class BottomState extends State<BottomNav> {
  @override
  int _selectedNavbar = 0;
  void _setValue(int index) {
    
    setState(() {
      _selectedNavbar = index;
    });
  }
  Widget build(BuildContext context) {
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