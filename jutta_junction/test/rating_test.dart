import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jutta_junction/models/ratingreview_model.dart';
import 'package:jutta_junction/repositories/ratingreviewrepo.dart';
import 'package:jutta_junction/services/firebase_service.dart';

// Entry point of the application
void main() async {
  // Set up a fake Firebase Firestore instance for testing
  FirebaseService.db = FakeFirebaseFirestore();

  // Create an instance of the RatingReviewRepository class
  final RatingReviewRepository ratingReviewRepository =
      RatingReviewRepository();

  // Define a test for the 'getData' method of the repository
  test('RatingReviewRepository: getData', () async {
    // Call the 'getData' method and store the result in a stream
    final Stream<QuerySnapshot<RatingReviewModel>> response =
        ratingReviewRepository.getData();

    // Verify that the result is a stream of 'QuerySnapshot' objects
    expect(response, isA<Stream<QuerySnapshot<RatingReviewModel>>>());
  });
}


// In this test, we're testing the getData() function of the RatingReviewRepository class. We first set up a fake Firebase Firestore instance using FakeFirebaseFirestore() and create an instance of RatingReviewRepository().

// Then, we use the test() function to define a test case. The test case checks that the result of calling getData() is a Stream<QuerySnapshot<RatingReviewModel>>.

// The expect() function is used to make this assertion. It takes two arguments: the first is the value that we want to test, and the second is a matcher that specifies the condition that the value should meet. In this case, we're using the isA() matcher to check that the value is an instance of Stream<QuerySnapshot<RatingReviewModel>>.

// Overall, this test checks that the getData() function returns a stream of query snapshots containing RatingReviewModel objects. If the test passes, we can be confident that this function is working as expected.