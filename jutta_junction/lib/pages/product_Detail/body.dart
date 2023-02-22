// import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:jutta_junction/pages/product_Detail/CartPage.dart';

import 'package:jutta_junction/pages/product_Detail/Product_Detail.dart';

import '../../Controller/cart_controller.dart';
import '../../Dashboard/ItemCart.dart';
import '../../Dashboard/Product.dart';

Widget _buildNewArrivals(
    {required String name, required double price, required String image}) {
  return Card(
    child: Container(
      height: 200,
      width: 150,
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/$image"),
              ),
            ),
          ),
          Text(
            "Rs. $price",
            style: TextStyle(
                color: Color(0xff9b96d6),
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),

          // IconButton(
          //   icon: Icon(Icons.check),
          //   onPressed: (() {}),
          // ),
        ],
      ),
    ),
  );
}

class Body extends StatelessWidget {
  get index => product2;
  final Product product;
  final cartController = Get.put(CartController());

  Body({key, required this.product}) : super(key: key);
  // bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    // VxState.watch(context, on: [AddMutation, RemoveMutation]);
    // final CartModel _cart = (VxState.store as MyStore).cart;
    // bool isInCart = _cart.items.contains(product) ?? false;
    bool isAdded = false;
    Size size = MediaQuery.of(context).size as Size;

    return SingleChildScrollView(
      // resizeToAvoidBottomInset:false,
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    product.image,
                    height: 200,
                    width: 200,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 120),
                    child: Image.asset(
                      "assets/images/greendot.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      " In Stock",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.03),
            height: size.height * 0.7,

            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                )),
            // child: new Image.asset('assets/images/Jutta.png'),
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Product Description",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black)),
                        Padding(
                          padding: EdgeInsets.only(left: 90),
                          child: Text("Rs${product.price}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(product.description),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Text("Size:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black)),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 30,
                            width: 30,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 121, 120, 120),
                                    blurRadius: 15.0,
                                    offset: Offset(5.0, 5.0))
                              ],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              child: Text(
                                "6",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 30,
                            width: 30,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 121, 120, 120),
                                    blurRadius: 15.0,
                                    offset: Offset(5.0, 5.0))
                              ],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              child: Text(
                                "6.5",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 30,
                            width: 30,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 121, 120, 120),
                                    blurRadius: 15.0,
                                    offset: Offset(5.0, 5.0))
                              ],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              child: Text(
                                "7",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 30,
                            width: 30,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 121, 120, 120),
                                    blurRadius: 15.0,
                                    offset: Offset(5.0, 5.0))
                              ],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              child: Text(
                                "8",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            cartController.to.addProduct(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Product is Added"
                                  " You have added the ${product.title} to the cart",
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            onPressed: (() {
                              cartController.to.addProduct(product);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => CartPage())));
                            }),
                            child: Text(
                              "Buy now",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "New arrivals",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "See all",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Buttom(
                              press: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Product_Detail(
                                            product: product2[index],
                                          )))))
                          // SingleChildScrollView(
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(9),
                          //     child: SingleChildScrollView(
                          //       physics: BouncingScrollPhysics(),
                          //       scrollDirection: Axis.horizontal,
                          //       child: Row(
                          //         children: [
                          //           Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               Padding(
                          //                 padding:
                          //                     const EdgeInsets.only(top: 10),
                          //                 child: Row(
                          //                   children: <Widget>[
                          //                     _buildNewArrivals(
                          //                         image: "nb550.png",
                          //                         price: 9000,
                          //                         name: "New Balance 550"),
                          //                     _buildNewArrivals(
                          //                         image: "vegan_black.png",
                          //                         price: 8000,
                          //                         name:
                          //                             "DR Martens Vegan Black"),
                          //                     _buildNewArrivals(
                          //                         image: "stan.png",
                          //                         price: 9000,
                          //                         name: "Stan Smith"),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class Buttom extends StatelessWidget {
  final Function press;
  const Buttom({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: 200,
        child: Column(
          children: [
            Row(
              children: [],
            ),
            Expanded(
                child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: product2.length,
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   //height of ticket paper
              //   childAspectRatio: 2.2,
              // ),
              itemBuilder: (context, index) => ItemCart(
                product: product2[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Product_Detail(
                              product: product2[index],
                            )))),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
