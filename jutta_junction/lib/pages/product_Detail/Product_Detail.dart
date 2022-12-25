import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jutta_junction/pages/product_Detail/body.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Product_detail extends StatefulWidget {
  const Product_detail({super.key});

  @override
  State<Product_detail> createState() => _Product_detailState();
}

class _Product_detailState extends State<Product_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      
      body: Body ( 
       
      ),
      
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 2, 5, 8),
        items: <Widget>[
          Icon(Icons.home),
          Icon(Icons.chat),
          Icon(Icons.shopping_cart),
          Icon(
            Icons.account_box,
            size: 30,
          ),
        ],
        onTap: (index) {
          //Handle button ta
        },
      ),
    );
  }
}
