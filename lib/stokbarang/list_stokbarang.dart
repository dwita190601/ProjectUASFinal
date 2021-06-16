import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_uts/models/stokbarang.dart';
import 'package:project_uts/stokbarang/add_stokbarang.dart';
import 'package:project_uts/stokbarang/update_stokbarang.dart';

class ListStok extends StatefulWidget {
  @override
  _ListStokState createState() => _ListStokState();
}

class _ListStokState extends State<ListStok> {
  List<Stok> _listStok = [];

  void getListStok() async {
    _listStok.clear();
    String url = 'http://192.168.43.5/db_api/getlist_stok.php';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      if (responseBody['succes']) {
        List listData = responseBody['data'];
        listData.forEach((itemStok) {
          _listStok.add(Stok.fromMap(itemStok));
        });
      } else {}
    } else {
      print('Request Error');
    }
    setState(() {});
  }

  void deleteStok(String id) async {
    var url = 'http://192.168.43.5/db_api/delete_stok.php';
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
    getListStok();
  }

  @override
  void initState() {
    getListStok();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Stok Barang Diary'),
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  getListStok();
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
              MaterialPageRoute(builder: (context) => AddBarang()),
            ).then((value) => getListStok());
          },
        ),
        body: _listStok.length > 0
            ? ListView.builder(
                itemCount: _listStok.length,
                itemBuilder: (context, index) {
                  Stok stok = _listStok[index];
                  if (stok == null) {
                    print('Stok Kosong');
                  } else {
                    print('Stok Ada');
                  }
                  return ListTile(
                    leading: Image.network(
                      stok.foto,
                      width: 80,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    title: Text(stok.nama),
                    subtitle: Text(stok.jumlah),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateStok(
                                stok: stok,
                              )),
                    ).then((value) => getListStok()),
                    trailing: Material(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red,
                      child: InkWell(
                        onTap: () {
                          deleteStok(stok.id);
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
