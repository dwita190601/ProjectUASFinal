import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'mahasiswa.dart';

class UpdateMahasiswa extends StatefulWidget {
  final Mahasiswa mahasiswa;
  UpdateMahasiswa({this.mahasiswa});
  @override
  _UpdateMahasiswaState createState() => _UpdateMahasiswaState();
}

class _UpdateMahasiswaState extends State<UpdateMahasiswa> {
  var _controllerNim = TextEditingController();

  var _controllerNama = TextEditingController();

  var _controllerJurusan = TextEditingController();

  void addNewMahasiswa() async {
    var url = 'http://192.168.43.5/db_api/update_mahasiswa.php';
    var response = await http.post(url, body: {
      'id': widget.mahasiswa.id,
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
  void initState() {
    _controllerNim.text = widget.mahasiswa.nim;
    _controllerNama.text = widget.mahasiswa.nama;
    _controllerJurusan.text = widget.mahasiswa.jurusan;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data Pelanggan'),
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
          SizedBox(height: 16),
          RaisedButton(
            onPressed: () {
              addNewMahasiswa();
            },
            child: Text(
              'Update',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
