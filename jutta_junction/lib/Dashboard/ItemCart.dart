import 'package:flutter/material.dart';
import 'package:jutta_junction/pages/product_Detail/Product_Detail.dart';
import 'package:like_button/like_button.dart';


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
          // width: 150,
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
                  
                
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(product.title, style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                      ),
                            Padding(
                              padding: const EdgeInsets.only(left:15),
                              child: LikeButton(
                      size: 20,
                      circleColor: CircleColor(
                          start: Color(0xff00ddff), end: Color(0xff0099cc)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Color(0xff33b5e5),
                        dotSecondaryColor: Color(0xff0099cc),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.favorite,
                          color: isLiked
                                ? Color.fromARGB(255, 255, 0, 0)
                                : Colors.grey,
                          size: 20,
                        );
                      },
                      //"like count backend code"
                      // likeCount: 69,
                      //  countBuilder: (int count, bool isLiked, String text) {
                      //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                      //   Widget result;
                      //   if (count == 0) {
                      //     result = Text(
                      //       "love",
                      //       style: TextStyle(color: color),
                      //     );
                      //   } else
                      //     result = Text(
                      //       text,
                      //       style: TextStyle(color: color),
                      //     );
                      //   return result;
                      // },
                    ),
                            ),
              
                    ],
                  ),
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
