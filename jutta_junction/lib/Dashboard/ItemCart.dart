import 'package:flutter/material.dart';


import 'Product.dart';

class ItemCart extends StatelessWidget {
  final Product product;
  // final Function press;
  const ItemCart({
    key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
       
        
        // height: 50,
        // width: 300,
        decoration: BoxDecoration(
          // boxShadow: ,
          color: Color.fromARGB(255, 230, 193, 193),
        //   image: DecorationImage(
        // image: AssetImage("assets/images/paper.jpg"),
        // fit: BoxFit.cover),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          
          // color: Colors.red,
          
        ),
        // height:100,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
                Row(
               children: [
                Text(product.title)
               ],),
               Row(
                children: [
                  Image.asset(product.image,height: 100,width: 100,),

                ],
               ),
            
              Row(
                children: <Widget>[
                  
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Price : ",style: TextStyle(color: Colors.black,
                        fontSize: 15,fontWeight: FontWeight.bold)),
                        TextSpan(text:"Rs${product.price}",style: TextStyle(color: Colors.black,
                        fontSize: 15,fontStyle: FontStyle.italic
                        ))
                    

                  ],
                  
                    ))
                ],
                //  mainAxisAlignment:MainAxisAlignment.center,
                // children: <Widget>[
                //   Text("Price"),
                //   Text( "\$${product1.price}")

                // ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
