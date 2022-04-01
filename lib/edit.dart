import 'package:flutter/material.dart';
import 'server/Model.dart';

class Update extends StatefulWidget {
  final List list;
  final int index;
  Update({this.list, this.index});
  @override
  UpdateHome createState() => UpdateHome();
}
  
class UpdateHome extends State<Update> {
  @override
  TextEditingController nama;
  TextEditingController stok;
  TextEditingController deskripsi;
  Model m = new Model();
  void initState()
  {
    nama = new TextEditingController(text: widget.list[widget.index]['nama_barang']);
    stok = new TextEditingController(text: widget.list[widget.index]['stok']);
    deskripsi = new TextEditingController(text: widget.list[widget.index]['catatan']);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Ubah Data"),
        )
      ),
      body: ListView(
        children: <Widget> [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              autofocus: true,
              controller: nama,
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
              controller: stok,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Masukan Stok Produk",
                labelText: "Nama Stok",
                icon: Icon(Icons.calculate),
                border: OutlineInputBorder()
              ),
              onChanged: (String value){
                m.stok = value;
              },
            )
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              autofocus: true,
              maxLines: 10,
              controller: deskripsi,
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
                m.updateBarang(widget.list[widget.index]['id_barang']);
                Navigator.pop(context);
              },
              child: const Text('Ubah Data'),
            ),
          ),
        ]
      ),
    );
  }
}
  