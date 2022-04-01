import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Model
{
  String nama_barang = "";
  String stok = "";
  String deskripsi = "";

  Future<List> getBarang() async{
    final response = await http.get("http://169.254.66.168/core_hmvc/barang");
    return jsonDecode(response.body);
  }
  void postBarang() {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse('http://169.254.66.168/core_hmvc/barang/insertData'));
    request.bodyFields = {
      'nama': nama_barang,
      'stok': stok,
      'deskripsi': deskripsi
    };
    request.headers.addAll(headers);
    request.send();
  }
  Future<void> deleteBarang(var id) async {
    final response = await http.get("http://169.254.66.168/core_hmvc/barang/hapusData/$id");
  }
  Future<void> updateBarang(var id) async
  {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': 'ci_session=p935e789r485c1p8kbmdcem67vc27bmq'
    };
    var request = http.Request('POST', Uri.parse('http://169.254.66.168/core_hmvc/barang/updateData/$id'));
    request.bodyFields = {
      'nama': nama_barang,
      'stok': stok,
      'deskripsi': deskripsi
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }
}