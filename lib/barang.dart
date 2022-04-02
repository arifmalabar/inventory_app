import 'dart:async';
import 'dart:convert';

import 'package:aplikasi_inventory/fundamental/Navbar.dart';
import 'package:flutter/material.dart';
import 'tambah.dart';
import 'edit.dart';
import 'server/Model.dart';
//import 'fundamental/BottomNav.dart';
import 'fundamental/BottomNav.dart';
import 'package:http/http.dart' as http;

class HomeApp extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeApp> {
  Timer time;
  List _barang = [];
  @override
  Model m = new Model();
  Future<void> getBarang() async {
    final response = await http.get("http://192.168.1.9/core_hmvc/barang");
    final barangData = jsonDecode(response.body);
    setState(() {
      _barang = barangData;
    });
  }

  void initState() {
    super.initState();
    getBarang();
    //time = Timer.periodic(Duration(seconds: 5), (Timer t) => autoRefresh());
  }

  void autoRefresh() {
    setState(() {
      getBarang();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => getBarang(),
        child: FutureBuilder<List>(
          future: m.getBarang(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            } else {
              if (snapshot.hasData) {
                _barang = snapshot.data;
                return _getList();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Tambah();
          }));
          setState(() {
            getBarang();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _getList() {
    return ListView.builder(
      itemCount: _barang == null ? 0 : _barang.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(_barang[i]['nama_barang']),
          leading: Icon(Icons.person),
          trailing: FlatButton(
            child: Icon(Icons.delete),
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
              _showMyDialog(_barang[i]['id_barang']);
            },
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) {
                return Update(list: _barang, index: i);
              }),
            );
          },
        );
      },
    );
  }

  Future<void> _showMyDialog(var id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Anda ingin menghapus data?'),
                Text('Data akan dihapus dari database secara permanen'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Hapus ae'),
              onPressed: () {
                m.deleteBarang(id);
                setState(() {
                  getBarang();
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
