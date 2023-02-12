import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Dashboard/Product.dart';

class CartController extends GetxController {
  get to => Get.find<CartController>();

  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    Get.snackbar(
      "Product Added",
      "You have added the ${product.title} to the cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product)) {
      if (_products[product] == 1) {
        _products.remove(product);
      } else {
        _products[product] -= 1;
      }
      Get.snackbar(
        "Product Removed",
        "you have removed the ${product.title} from the cart",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
  }

  get products => _products;
  get productSubtotal => _products.entries.map((product) => product.key.price *product.value).toList();
  get total => _products.entries.map((product) => product.key.price *product.value).toList().reduce((value, element) => value + element).toStringAsFixed(2);
}
