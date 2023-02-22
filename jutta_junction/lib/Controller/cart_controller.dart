

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Dashboard/Product.dart';

class CartController extends GetxController {
  double deliveryFee = 200;
  
  get to => Get.find<CartController>();
    

  var _products = {}.obs;
  
  // BuildContext get context => null;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
//    ScaffoldMessenger.of(context).showSnackBar(
//   SnackBar(
//     content: Text("Product is Added"
//       "You have added the ${product.title} to the cart",
//       textAlign: TextAlign.center,
//     ),
//     duration: Duration(seconds: 2),
//   ),
// );

    
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product)) {
      if (_products[product] == 1) {
        _products.remove(product);
      } else {
        _products[product] -= 1;
      }
//        ScaffoldMessenger.of(context).showSnackBar(
//   SnackBar(
//     content: Text("Product is Removed"
//       "You have added the ${product.title} to the cart",
//       textAlign: TextAlign.center,
//     ),
//     duration: Duration(seconds: 2),
//   ),
// );
     
      // Get.snackbar(
      //   "Product Removed",
      //   "you have removed the ${product.title} from the cart",
      //   snackPosition: SnackPosition.TOP,
      //   duration: Duration(seconds: 2),
      // );
    }
  }


  get products => _products;
  get productSubtotal => _products.entries.map((product) => product.key.price *product.value).toList();
  get total => _products.entries.map((product) => product.key.price *product.value).toList().reduce((value, element) => value + element).toStringAsFixed(2);
    get sum => _products.entries.map((product) => (product.key.price *product.value+deliveryFee)).toList();
}
