import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jutta_junction/models/ratingreview_model.dart';
import 'package:jutta_junction/repositories/ratingreviewrepo.dart';
import 'package:jutta_junction/services/firebase_service.dart';

void main() async {
  FirebaseService.db = FakeFirebaseFirestore();
  final RatingReviewRepository ratingReviewRepository =
      RatingReviewRepository();

  test('RatingReviewRepository: getData', () async {
    final Stream<QuerySnapshot<RatingReviewModel>> response =
        ratingReviewRepository.getData();
    expect(response, isA<Stream<QuerySnapshot<RatingReviewModel>>>());
  });
}
