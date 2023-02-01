import 'package:flutter/material.dart';
import 'package:jutta_junction/pages/product_Detail/Product_Detail.dart';


import 'Product.dart';

class ItemCart extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCart({
   key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Product_Detail(product: product),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: product.color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(product.image, height: 100, width: 100),
                  ],
                ),
                Row(
                  children: [
                    Text(product.title, style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Price: ", style: TextStyle(color: Color.fromARGB(255, 96, 96, 96),
                            fontSize: 15)),
                          TextSpan(text: "Rs${product.price}", style: TextStyle(color: Color.fromARGB(255, 133, 122, 255),
                            fontSize: 15, fontStyle: FontStyle.italic
                          ))
                        ],
                      )
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
