import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_uts/localhost/add_mahasiswa.dart';
import 'package:project_uts/localhost/mahasiswa.dart';
import 'package:project_uts/localhost/update_mahasiswa.dart';

class ListMahasiswa extends StatefulWidget {
  @override
  _ListMahasiswaState createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  List<Mahasiswa> _listMahasiswa = [];

  void getListMahasiswa() async {
    _listMahasiswa.clear();
    String url = 'http://192.168.43.5/db_api/get_list_mahasiswa.php';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      if (responseBody['succes']) {
        List listData = responseBody['data'];
        listData.forEach((itemMahasiswa) {
          _listMahasiswa.add(Mahasiswa.fromMap(itemMahasiswa));
        });
      } else {}
    } else {
      print('Request Error');
    }
    setState(() {});
  }

  void deleteMahasiswa(String id) async {
    var url = 'http://192.168.43.5/db_api/delete_mahasiswa.php';
    var response = await http.post(
      url,
      body: {'id': id},
    );
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
    getListMahasiswa();
  }

  @override
  void initState() {
    getListMahasiswa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Pelanggan Diary'),
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  getListMahasiswa();
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          // backgroundColor: Colors.amber,
          // foregroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddMahasiswa()),
            ).then((value) => getListMahasiswa());
          },
        ),
        body: _listMahasiswa.length > 0
            ? ListView.builder(
                itemCount: _listMahasiswa.length,
                itemBuilder: (context, index) {
                  Mahasiswa mahasiswa = _listMahasiswa[index];
                  return ListTile(
                    leading: Image.network(
                      mahasiswa.foto,
                      width: 80,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    title: Text(mahasiswa.nama),
                    subtitle: Text("Kode. " + mahasiswa.nim),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateMahasiswa(
                                mahasiswa: mahasiswa,
                              )),
                    ).then((value) => getListMahasiswa()),
                    trailing: Material(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red,
                      child: InkWell(
                        onTap: () {
                          deleteMahasiswa(mahasiswa.id);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text('Masukkan Data!'),
              ));
  }
}
