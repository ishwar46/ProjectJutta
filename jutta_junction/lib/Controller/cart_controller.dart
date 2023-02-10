import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Dashboard/Product.dart';

class CartController extends GetxController{
final _products ={}.obs;
void addProduct(Product product){
  if (_products.containsKey(product) ){
    _products[product] +=1;
  }else{
    _products[product]=1;
  }
  Get.snackbar(
  "Product Added",
  "you have added the ${product.title} to the cart",
  snackPosition:SnackPosition.BOTTOM,
  duration: Duration(seconds: 2),

);
}
get products => _products;

}
