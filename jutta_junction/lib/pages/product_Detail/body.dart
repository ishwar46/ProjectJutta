import 'dart:ui';
// import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jutta_junction/models/product_model.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
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
                  "Nike",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 0),
                child: Image.asset(
                  "assets/images/nikes.png",
                  height: 200,
                  width: 200,
                ),
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
            height: size.height * 0.95,

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
                          child: Text("Rs 90000",
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
                        child: Text(
                            "Dunk High Retro sneakersA basketball silhouette, the Nike Dunk Retro is presented in a supportive high-top design here. Contrasting white and black tones create an effortlessly eye-catching look for the pair."),
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
                        ElevatedButton(
                          onPressed: (() {}),
                          child: Text("Add to cart"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            elevation: 15,
                            shadowColor: Colors.black54,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: (() {}), child: Text("Buy now"))
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
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(9),
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Row(
                                            children: <Widget>[
                                              _buildNewArrivals(
                                                  image: "nb550.png",
                                                  price: 9000,
                                                  name: "New Balance 550"),
                                              _buildNewArrivals(
                                                  image: "vegan_black.png",
                                                  price: 8000,
                                                  name:
                                                      "DR Martens Vegan Black"),
                                              _buildNewArrivals(
                                                  image: "stan.png",
                                                  price: 9000,
                                                  name: "Stan Smith"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
}
