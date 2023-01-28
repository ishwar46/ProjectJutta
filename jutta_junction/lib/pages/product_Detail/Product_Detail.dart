import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jutta_junction/pages/product_Detail/body.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../Dashboard/Product.dart';
class Product_Detail extends StatelessWidget {
  final Product product;
  const Product_Detail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset:false,
      
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      
      body: Body (product: product, 
       
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