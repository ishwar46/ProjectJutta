import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


import '../models/ratingreview_model.dart';

import '../repositories/ratingreviewrepo.dart';

class RatingReviewViewModel with ChangeNotifier{
  RatingReviewRepository _ratingReviewRepository =RatingReviewRepository();
  Stream<QuerySnapshot<RatingReviewModel>>? _ratingreview;
  Stream<QuerySnapshot<RatingReviewModel>>? get ratingreview => _ratingreview;

  Future<void> getRatingReview() async{
    var response = _ratingReviewRepository.getData();

    _ratingreview = response;
    notifyListeners();
  }
}