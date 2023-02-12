import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jutta_junction/Controller/cart_controller.dart';

class CartTotal
 extends StatelessWidget {
  final CartController controller =Get.find();
CartTotal({Key?key}):super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        
        child:Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
          
             Text("Total",style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
              Text("${controller.total}",style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
          ],
        )
      ),
    );
  }
}