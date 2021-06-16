import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddBarang extends StatelessWidget {
  var _controllerNama = TextEditingController();
  var _controllerJenis = TextEditingController();
  var _controllerJumlah = TextEditingController();

  void addNewStok() async {
    var url = 'http://192.168.43.5/db_api/add_stok.php';
    var response = await http.post(url, body: {
      'nama': _controllerNama.text,
      'jenis': _controllerJenis.text,
      'jumlah': _controllerJumlah.text,
    });
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      if (responseBody['succes']) {
        print('Berhasil');
      } else {
        print('Gagal-------------');
      }
    } else {
      print('Request Eror');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Stok Barang'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: _controllerNama,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nama Barang'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: _controllerJenis,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Jenis Barang'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: _controllerJumlah,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Jumlah Stok'),
            ),
          ),
          SizedBox(height: 8),
          RaisedButton(
            onPressed: () {
              addNewStok();
            },
            child: Text(
              'Add',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
