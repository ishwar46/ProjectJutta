// To parse this JSON data, do
//
//     final ratingReviewModel = ratingReviewModelFromJson(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

RatingReviewModel ratingReviewModelFromJson(String str) => RatingReviewModel.fromJson(json.decode(str));

String ratingReviewModelToJson(RatingReviewModel data) => json.encode(data.toJson());

class RatingReviewModel {
  RatingReviewModel({

    required this.rating,
    required this.review,
    required this.username,
  });

  String rating;
  String review;
  String username;

  factory RatingReviewModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) => RatingReviewModel(
    rating: json["Rating"],
    username: json["Username"],
    review: json["Review"],
  );

  factory RatingReviewModel.fromJson(Map<String, dynamic> json) => RatingReviewModel(
    rating: json["Rating"],
    review: json["Review"],
    username: json["Username"],
  );

  Map<String, dynamic> toJson() => {
    "Rating": rating,
    "Review": review,
    "Username": username,
  };

}