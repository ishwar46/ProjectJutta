import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'cartproducts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Your Cart"),
    ),
    body:Column(
      children: [
        CartProducts(),
        // CartTotal(),
        
      ],
    )
    
    
    ,);
  }
}