import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jutta_junction/Controller/cart_controller.dart';
import 'package:jutta_junction/Dashboard/Product.dart';
import 'package:jutta_junction/pages/chatbot/ChatPage.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  CartProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 450,
          child: ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: ((BuildContext context, int index) {
                return CartProductCard(
                  controller: controller,
                  product: controller.products.keys.toList()[index],
                  quantity: controller.products.values.toList()[index],
                  index: index,
                );
              })),
        ));
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  CartProductCard(
      {required this.controller,
      required this.product,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10,bottom: 10),
            child: Image.asset(
              
              product.image,
              width: 80,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                product.title,
                style: TextStyle(

                    // fontWeight: FontWeight.bold
                    ),
              ),
              Text("Rs${product.price}",
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          )),
          IconButton(
              onPressed: () {
                controller.removeProduct(product);
                       ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text("Product is Removed"
      " You have added the ${product.title} to the cart",
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
  ),
);
              },
              icon: Icon(Icons.remove_circle_outline)),
          Text('${quantity}'),
          IconButton(
              onPressed: () {
                controller.addProduct(product);
                   ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text("Product is Added"
      " You have added the ${product.title} to the cart",
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
  ),
);
              },
              icon: Icon(Icons.add_circle_outline)),
        ],
      ),
    );
  }
}
