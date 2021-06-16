import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_uts/models/stokbarang.dart';
import 'dart:convert';

class UpdateStok extends StatefulWidget {
  final Stok stok;
  UpdateStok({this.stok});
  @override
  _UpdateStokState createState() => _UpdateStokState();
}

class _UpdateStokState extends State<UpdateStok> {
  var _controllerNama = TextEditingController();

  var _controllerJenis = TextEditingController();

  var _controllerJumlah = TextEditingController();

  void addNewStok() async {
    var url = 'http://192.168.43.5/db_api/update_stok.php';
    var response = await http.post(url, body: {
      'id': widget.stok.id,
      'nama': _controllerNama.text,
      'jenis': _controllerJenis.text,
      'jumlah': _controllerJumlah.text,
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
    _controllerNama.text = widget.stok.nama;
    _controllerJenis.text = widget.stok.jenis;
    _controllerJumlah.text = widget.stok.jumlah;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data Stok Barang'),
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
          SizedBox(height: 16),
          RaisedButton(
            onPressed: () {
              addNewStok();
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
