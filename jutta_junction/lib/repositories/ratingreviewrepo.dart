import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/ratingreview_model.dart';
import '../services/firebase_service.dart';

class RatingReviewRepository{
  CollectionReference<RatingReviewModel> ref =
  FirebaseService.db.collection("ratingreview")
      .withConverter<RatingReviewModel>(
    fromFirestore: (snapshot,_) {
      return RatingReviewModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );


  Stream<QuerySnapshot<RatingReviewModel>> getData()  {
    Stream<QuerySnapshot<RatingReviewModel>> response = ref
        .snapshots();
    return response;
  }

  Future<RatingReviewModel?> getOneData(String id) async {
    DocumentSnapshot<RatingReviewModel> response = await ref.doc(id).get();
    return response.data();
  }

  Future<void> addRatingReview(RatingReviewModel data) async {
    await ref.add(data);
  }

}