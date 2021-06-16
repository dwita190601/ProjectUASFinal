import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddMahasiswa extends StatelessWidget {
  var _controllerNim = TextEditingController();
  var _controllerNama = TextEditingController();
  var _controllerJurusan = TextEditingController();

  void addNewMahasiswa() async {
    var url = 'http://192.168.43.5/db_api/add_mahasiswa.php';
    var response = await http.post(url, body: {
      'nim': _controllerNim.text,
      'nama': _controllerNama.text,
      'jurusan': _controllerJurusan.text,
    });
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      if (responseBody['succes']) {
        print('Berhasil');
      } else {
        print('Gagal');
      }
    } else {
      print('Request Eror');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data Pelanggan'),
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
                  border: OutlineInputBorder(), labelText: 'Nama Pelanggan'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: _controllerJurusan,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Alamat'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: _controllerNim,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Kode Barang'),
            ),
          ),
          SizedBox(height: 8),
          RaisedButton(
            onPressed: () {
              addNewMahasiswa();
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
