import 'package:flutter/material.dart';


//import halaman yang akan diload kemusian beri alias
import './beranda.dart' as beranda;
import './produklist.dart' as listproduk;
import 'iu/home.dart' as Home;


//top level root
void main() {
  runApp(new MaterialApp(
    title: "tab Bar",
    home: new MyApp(),
  ));
}

//menggunakan StatefulWidget
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

//panggil juga SingleTickerProviderStateMixin
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  //deklarasikan variabel controller untuk mengatur tabbar
  TabController controller;
  //tambah initState unutk inisialisasi dan mengaktifkan tab
  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  //tambah dispose unutk berpindah halaman
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //gunakan widget Scaffold
    return Scaffold(
      //widget TabBarView
      body: new TabBarView(
        //terdapat controller untuk mengatur halaman
        controller: controller,
        children: <Widget>[
          //pemanggil halaman dimulai dari alias.ClassName halaman yang diload
          new beranda.Beranda(),
          new listproduk.Produklist(),
          new Home.Home(),
        ],
      ),
      //membuat bottom tab
      bottomNavigationBar: new Material(
        color: Colors.deepOrange,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            //menggunakan icon untuk mempercantik tab
            //icon berurutan sesuai penggilan halaman
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.list)),
            new Tab(icon: new Icon(Icons.add_chart)),
          ],
        ),
      ),
    );
  }
}