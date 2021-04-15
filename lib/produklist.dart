import 'package:flutter/material.dart';
import './detailproduk.dart';

class Produklist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange, title: Text("Product Listing")),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  name: "BW KULOT",
                  description: "Bahan katun linen lembut dan tidak tembus pandang (all size)",
                  price: 80000,
                  image: "produklima.jpg",
                  star: 4,
                ),
              ));
            },
            //menambah class ProductBox
            child: ProductBox(
              //berisi parameter yang diperlukan di class ProcuctBox
              name: "BW KULOT",
              description: "Bahan katun linen lembut dan tidak tembus pandang (all size)",
              price: 80000,
              image: "produklima.jpg",
              star: 4,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                       name: "LIYA SET",
                       description: "Bahan rayon lembut dan tidak tembus pandang (all size)",
                       price: 70000,
                       image: "produksatu.jpg",
                       star: 4,
                      )));
            },
            child: ProductBox(
              //berisi parameter yang diperlukan di class ProcuctBox
              name: "LIYA SET",
              description: "Bahan rayon lembut dan tidak tembus pandang (all size)",
              price: 70000,
              image: "produksatu.jpg",
              star: 4,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                        name: "LIYA TOP",
                        description: "Bahan rayon lembut dan tidak tembus pandang (all size)",
                        price: 50000,
                        image: "produkdua.jpg",
                        star: 4,
                      )));
            },
            child: ProductBox(
              //berisi parameter yang diperlukan di class ProcuctBox
              name: "LIYA TOP",
              description: "Bahan rayon lembut dan tidak tembus pandang (all size)",
              price: 50000,
              image: "produkdua.jpg",
              star: 4,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                        name: "KULOT DAISY SERIES",
                        description: "Bahan rayon lembut dan tidak tembus pandang (all size)",
                        price: 45000,
                        image: "produktiga.jpg",
                        star: 4,
                      )));
            },
            child: ProductBox(
              //berisi parameter yang diperlukan di class ProcuctBox
              name: "KULOT DAISY SERIES",
              description: "Bahan rayon lembut dan tidak tembus pandang (all size)",
              price: 45000,
              image: "produktiga.jpg",
              star: 4,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                        name: "KULOT BUTTON",
                        description: "Bahan rayon lembut dan tidak tembus pandang (all size)",
                        price: 60000,
                        image: "produkempat.jpg",
                        star: 2,
                      )));
            },
            child: ProductBox(
              //berisi parameter yang diperlukan di class ProcuctBox
             name: "KULOT BUTTON",
              description: "Bahan rayon lembut dan tidak tembus pandang (all size)",
              price: 60000,
              image: "produkempat.jpg",
              star: 2,
            ),
          ),
        ],
      ),
    );
  }
}

//menggunakan Wigdet StatelessWidget
class ProductBox extends StatelessWidget {
  //deklarasi variabel yang diterima dari MyhomePage
  ProductBox(
      {Key key, this.name, this.description, this.price, this.image, this.star})
      : super(key: key);
  //variabel yang digunakan untuk menmpung parameter tersebut
  final String name;
  final String description;
  final int price;
  final String image;
  final int star;
  final children = <Widget>[];
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < star; i++) {
      children.add(new Icon(
        Icons.star,
        size: 10,
        color: Colors.deepOrange,
      ));
    }
    //menggunakan widget Container
    return Container(
      //padding
      padding: EdgeInsets.all(10),
      //height: 120
      //menggunakan widget card
      child: Card(
        //membuat tampilan secara horizontal antar imag dan deskripsi
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //children digunakan untuk menampung banyak widget
          children: <Widget>[
            Image.asset(
              "assets/images/" + image,
              width: 150,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(5),
              //membuat tampilan secara vertical
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //isi tampilan vertical
                children: <Widget>[
                  Text(this.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Text(this.description),
                  Text("Price: " + this.price.toString(),
                      style: TextStyle(color: Colors.orange)),
                  //menampilkan Widget Icon dibungkus dengan row
                  Row(
                    children: <Widget>[
                      Row(
                        children: children,
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
