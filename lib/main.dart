import 'package:flutter/material.dart';
import 'package:project_uts/login/login_user.dart';
import 'package:project_uts/stokbarang/list_stokbarang.dart';

//import halaman yang akan diload kemusian beri alias

import 'beranda.dart';
import 'iu/home.dart';
import 'localhost/list_mahasiswa.dart' as ListPelanggan;
import 'produklist.dart';

//top level root
void main() {
  runApp(new MaterialApp(
    title: "tab Bar",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    home: new Login(),
  ));
}

//menggunakan StatefulWidget
class MyApp extends StatefulWidget {
  final String id_user;
  const MyApp({Key key, this.id_user}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

//panggil juga SingleTickerProviderStateMixin
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  //deklarasikan variabel controller untuk mengatur tabbar
  int _currentIndex = 0;
  List<Map> _listNav = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.list, 'label': 'List'},
    {'icon': Icons.shopping_cart, 'label': 'Penjualan'},
    {'icon': Icons.add_chart, 'label': 'Pelanggan'},
    {'icon': Icons.add_outlined, 'label': 'Stok'},
  ];
  List<Widget> _listPage = [
    Beranda(),
    Produklist(),
    Home(),
    ListPelanggan.ListMahasiswa(),
    ListStok()
  ];

  @override
  Widget build(BuildContext context) {
    //gunakan widget Scaffold
    return Scaffold(
      body: _listPage[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFDAB68C),
          currentIndex: _currentIndex,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          onTap: (newValue) {
            setState(() {
              _currentIndex = newValue;
            });
          },
          items: List.generate(_listNav.length, (index) {
            return BottomNavigationBarItem(
              label: _listNav[index]['label'],
              icon: Icon(_listNav[index]['icon']),
            );
          })),
    );
  }
}
