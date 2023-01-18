import 'package:flutter/material.dart';
class Product{
  final String image, title,description;
  final int price,id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.color,

  });
  List<Product> products=[
    Product(
      id:1,
      title:"Nike",
      price:4000,
      description:"jdhfjahfsdahfuhdfjhadsh",
      image:"assets/images/nike.png",
      color: Colors.lightBlue,
),
   Product(
      id:1,
      title:"Nike",
      price:4000,
      description:"jdhfjahfsdahfuhdfjhadsh",
      image:"assets/images/nike.png",
      color: Colors.lightBlue,
),

   Product(
      id:2,
      title:"jordan",
      price:4000,
      description:"jdhfjahfsdahfuhdfjhadsh",
      image:"assets/images/jordan.png",
      color: Colors.lightBlue,
),
   Product(
      id:3,
      title:"Nike",
      price:4000,
      description:"jdhfjahfsdahfuhdfjhadsh",
      image:"assets/images/nike.png",
      color: Colors.lightBlue,
),
   Product(
      id:4,
      title:"Nike",
      price:4000,
      description:"jdhfjahfsdahfuhdfjhadsh",
      image:"assets/images/nike.png",
      color: Colors.lightBlue,
),
   Product(
      id:5,
      title:"Nike",
      price:4000,
      description:"jdhfjahfsdahfuhdfjhadsh",
      image:"assets/images/nike.png",
      color: Colors.lightBlue,
),
   Product(
      id:6,
      title:"Nike",
      price:4000,
      description:"jdhfjahfsdahfuhdfjhadsh",
      image:"assets/images/nike.png",
      color: Colors.lightBlue,
),
   Product(
      id:7,
      title:"Nike",
      price:4000,
      description:"jdhfjahfsdahfuhdfjhadsh",
      image:"assets/images/nike.png",
      color: Colors.lightBlue,
)
  

  ];


}