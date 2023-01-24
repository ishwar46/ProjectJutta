
// ignore: empty_constructor_bodies
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Product {
  final String  name, image, discription;
  final int  price, id ,no;
  final Color color;
  Product(
    {
      required this.id,
      required this.no,
      required this.discription,
      required this.image,
      required this.name,
      required this.price,
      required this.color,

    }
  );
}
List<Product> product1=[
  Product(id: 1, no: 11, discription: "jutta", image: "assets/images/converse.png", name: "Converse", price: 3000,color: Colors.red),
  Product(id: 1, no: 11, discription: "jutta", image: "assets/images/adidaslogo.png", name: "Adidas", price: 5000,color: Colors.red),
  Product(id: 1, no: 11, discription: "jutta", image: "assets/images/jordan4.png", name: "JORDAN 4", price: 7000,color: Colors.red),
  Product(id: 1, no: 11, discription: "jutta", image: "assets/images/drmartenslogo.png", name: "DrMartin", price: 5000,color: Colors.red),

];