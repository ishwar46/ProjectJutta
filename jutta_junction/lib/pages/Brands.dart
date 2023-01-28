import 'package:flutter/material.dart';
import 'package:jutta_junction/pages/product_Detail/Product.dart';
import 'package:jutta_junction/pages/product_Detail/Product_Detail.dart';

// import '../models/product.dart';
class Brands extends StatelessWidget {
  final Product product;
  const Brands({
    key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      child: Column(
        children: <Widget>[
          InkWell(
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     // MaterialPageRoute(
            //       // builder: (context) => const Product_detail(),
            //     ),
            //   );
            // },
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(product1[0].image),
                ),
              ),
            ),
          ),
          Text(
            product1[0].name,
            style: TextStyle(
                color: Color(0xff9b96d6),
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Rs${product1[0].price}",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          // IconButton(
          //   icon: Icon(Icons.check),
          //   onPressed: (() {}),
          // ),
        ],
      ),
    );
  }
}
