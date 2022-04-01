import 'package:flutter/material.dart';
import 'package:aplikasi_inventory/dashboard.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color:Colors.blue,
            ),
            child: Text("Heading")
          ),
          ListTile(
            title: Text("Item1"),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Item1"),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Item1"),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ], 
      ),
    );
  }  
}