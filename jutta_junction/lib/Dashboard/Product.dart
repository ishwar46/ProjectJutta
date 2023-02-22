import 'package:flutter/material.dart';
// class CatalogModel {
//   static List<Product> product;

//   // Get Item by ID
//   Product getById(int id) =>
//       product.firstWhere((element) => element.id == id, orElse: null);

//   // Get Item by position
//   Product getByPosition(int pos) => product[pos];
// }

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

  get length => null;

  get product1 => null;
} 
  List<Product> product1=[
    Product(
      id:1,
      title:"Jordan",
      price:14000,
      description:"jordan shoes is one of the best selling shoes in our app",
      image:"assets/images/jordan4.png",
      color: Color.fromARGB(255, 236, 226, 226),
),
       Product(
      id:2,
      title:"Stan",
      price:5000,
      description:"stan shoes is one of the best selling shoes in our app",
      image:"assets/images/stan.png",
      color: Color.fromARGB(255, 195, 195, 195),
),
    Product(
      id:3,
      title:"NB550",
      price:10000,
      description:"Buy and sell StockX Verified New Balance 550 White Green shoes BB550WT1 and thousands of other New Balance sneakers with price data and release dates.",
      image:"assets/images/nb550.png",
      color: Color.fromARGB(255, 170, 228, 173),
),
    Product(
      id:4,
      title:"Vegan Black",
      price:14000,
      description:"Non leather, cruelty free and Leather free shoes, boots and trainers .",
      image:"assets/images/vegan_black.png",
      color: Color.fromARGB(255, 197, 166, 154),
),
    Product(
      id:5,
      title:"Nike",
      price:12000,
      description:"Air Jordan is a line of basketball shoes and athletic apparel produced by American corporation Nike",
      image:"assets/images/nikes.png",
      color: Color.fromARGB(255, 138, 160, 210),
),
  
  

  ];
 List<Product> product2=[
    Product(
      id:1,
      title:"Converse",
      price:14000,
      description:"Add a classic sneaker style to your rotation with green Converse shoes",
      image:"assets/images/converse.png",
      color: Color.fromARGB(255, 170, 228, 173),
),
       Product(
      id:2,
      title:"Nike Air",
      price:5000,
      description:"Buy and sell StockX Verified New Balance 550 White Green shoes BB550WT1 and thousands of other New Balance sneakers with price data and release dates.",
      image:"assets/images/air.png",
      color: Color.fromARGB(255, 195, 195, 195),
),
    Product(
      id:3,
      title:"NB550",
      price:10000,
      description:"Buy and sell StockX Verified New Balance 550 White Green shoes BB550WT1 and thousands of other New Balance sneakers with price data and release dates.",
      image:"assets/images/nb550.png",
      color: Color.fromARGB(255, 170, 228, 173),
),
    Product(
      id:5,
      title:"Nike",
      price:12000,
      description:"Air Jordan is a line of basketball shoes and athletic apparel produced by American corporation Nike",
      image:"assets/images/nikes.png",
      color: Color.fromARGB(255, 138, 160, 210),
),
  
  

  ];
        
