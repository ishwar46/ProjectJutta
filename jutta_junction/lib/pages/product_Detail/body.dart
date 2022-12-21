import 'dart:ui';
// import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size as Size;

    return Column(
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
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Image.asset(
                  "assets/images/greendot.png",
                  height: 20,
                  width: 20,
                ),
                Text("Stock"),
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.05),
          height: size.height * 0.48,

          decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 162, 162),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              )),
          // child: new Image.asset('assets/images/Jutta.png'),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
