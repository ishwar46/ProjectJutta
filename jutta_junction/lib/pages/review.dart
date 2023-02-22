import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/ratingreview_model.dart';


class UserRatingReview extends StatefulWidget {
  const UserRatingReview({Key? key}) : super(key: key);

  @override
  State<UserRatingReview> createState() => _UserRatingReviewState();
}

class _UserRatingReviewState extends State<UserRatingReview> {
  TextEditingController review = new TextEditingController();
  final form = GlobalKey<FormState>();

  double newRating = 0.0;
  hintStyle() {
    TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  formsOutline() {
    OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(30));
  }

  Future<void> submitRatingReview() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final data = RatingReviewModel(
      rating: "$newRating",
      review: review.text, username: '',
    );

    db.collection("ratingreview").add(data.toJson()).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Rating and review submitted ")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rating and review'),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: form,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Rating and Review',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        newRating = rating;
                        print(rating);
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: review,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "review is required";
                          }
                          if (!RegExp(r"^[a-zA-Z]").hasMatch(value)) {
                            return "Please review ";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          hintText: "Review",
                          hintStyle: hintStyle(),
                        ),
                      ),
                      ElevatedButton(
                        
                          onPressed: () {
                            submitRatingReview();
                          },
                          child: Text("Submit"))
                    ],
                  ),
                ]),
          ),
        ));
  }
}