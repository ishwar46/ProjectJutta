import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jutta_junction/pages/product_Detail/body.dart';

class Product_detail extends StatefulWidget {
  const Product_detail({super.key});

  @override
  State<Product_detail> createState() => _Product_detailState();
}

class _Product_detailState extends State<Product_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newMethod(context),
      
      body: Body( ),
      
    
    );
  }

  AppBar newMethod(BuildContext context) {
    return AppBar(
       automaticallyImplyLeading: false,
       leading: Navigator.canPop(context)
      ? IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 47,
          ),
          onPressed: () => Navigator.of(context).pop(),
        )
      : null,
      
    );
  }
}