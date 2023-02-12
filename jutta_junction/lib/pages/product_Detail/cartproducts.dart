import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jutta_junction/Controller/cart_controller.dart';
import 'package:jutta_junction/Dashboard/Product.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
 
  
  CartProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 600,
        child: ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: ((BuildContext context, int index) {
            return CartProductCard(
              controller: controller,
              product: controller.products.keys.toList()[index],
              quantity: controller.products.values.toList()[index],
              index: index,
            );
          })
        )
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  CartProductCard({
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(product.image),
          )
        ],
      ),
    );
  }
}
