import 'package:aplikasi_inventory/server/Model.dart';
import 'package:flutter/material.dart';
import 'barang.dart';
import 'main.dart';

class Tambah extends StatefulWidget {
  @override
  TambahHome createState() => TambahHome();
}
  
class TambahHome extends State<Tambah> {
  Model m = new Model();
  HomeState h = new HomeState();
  
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("tambah Data"),
        )
      ),
      body: ListView(
        children: <Widget> [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Masukan nama produk",
                labelText: "Nama Produk",
                icon: Icon(Icons.add_box),
                border: OutlineInputBorder()
              ),
              onChanged: (String value){
                m.nama_barang = value;
              },
            )
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Masukan Stok Produk",
                labelText: "Nama Stok", 
                icon: Icon(Icons.calculate),
                border: OutlineInputBorder()
              ),
              onChanged: (String value) {
                m.stok = value;
              },
            )
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              autofocus: true,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "Masukan nama produk",
                labelText: "Nama Produk",
                icon: Icon(Icons.note),
                border: OutlineInputBorder()
              ),
              onChanged: (String value){
                m.deskripsi = value;
              },
            )
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                m.postBarang();
                setState(() {
                  h.getBarang();
                });
                Navigator.pop(context);
              },
              child: const Text('Simpan Data'),
            ),
          ),
        ]
      ),
    );
  }
}
  