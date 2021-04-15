import 'package:flutter/material.dart';

class DetailProduk extends StatefulWidget {
  DetailProduk(
      {Key key, this.name, this.description, this.price, this.image, this.star})
      : super(key: key);
  //variabel yang digunakan untuk menmpung parameter tersebut
  final String name;
  final String description;
  final int price;
  final String image;
  final int star;
  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  //inisialisasi variabel star
  final childrenstar = <Widget>[];
  @override
  //membuat widget
  Widget build(BuildContext context) {
    //membuat star secara dimanis sesuai dengan jumlah star yang dikirim dari list produk
    for (var i = 0; i < widget.star; i++) {
      childrenstar.add(new Icon(
        Icons.star,
        size: 15,
        color: Colors.deepOrange,
      ));
    }
    //widget Scaffold sebagai isi halaman
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: new Text("${widget.name}"),
      ),
      body: new Container(
        width: double.infinity,
        //detail produk dalam container dibungkus dengan widget listview agar bisa discroll
        child: new ListView(
          //isi didalam dibungkus dnegan widget
          children: <Widget>[
            Column(
              children: <Widget>[
                new Image.asset("assets/images/" + widget.image)
              ],
            ),
            Container(
              //decoration digunakan untuk memberi desain berupa background
              //decoration dapat digunakan pada widget container
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xFFFB8C00), const Color(0xFFFFB74D)],
                ),
              ),
              padding: EdgeInsets.all(10),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: childrenstar,
                  ),
                  new Container(
                    child: new Text(
                      this.widget.price.toString(),
                      //memberi style pada text
                      style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "NeoSansBold"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.orange,
              width: double.infinity,
              height: double.maxFinite,
              child: new Text(widget.description),
            )
          ],
        ),
      ),
    );
  }
}
