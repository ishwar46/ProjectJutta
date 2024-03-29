import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import '../services/firebase_service.dart';

class AuthRepository {
  CollectionReference<UserModel> userRef =
      FirebaseService.db.collection("users").withConverter<UserModel>(
            fromFirestore: (snapshot, _) {
              return UserModel.fromFirebaseSnapshot(snapshot);
            },
            toFirestore: (model, _) => model.toJson(),
          );
  Future<UserCredential?> register(UserModel user) async {
    try {
      final response =
          await userRef.where("username", isEqualTo: user.username!).get();
      if (response.size != 0) {
        throw Exception("Username already exists");
      }
      UserCredential uc = await FirebaseService.firebaseAuth
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);

      user.userId = uc.user!.uid;
      user.fcm = "";
      // insert into firestore user table
      await userRef.add(user);
      return uc;
    } catch (err) {
      rethrow;
    }
  }

  Future<UserCredential> login(String email, String password) async {
    try {
      print(email);
      UserCredential uc = await FirebaseService.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      print("REPOSITORY " " " + uc.toString());
      return uc;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<UserModel> getUserDetail(String id) async {
    try {
      final response = await userRef.where("user_id", isEqualTo: id).get();

      var user = response.docs[0].data();
      user.fcm = "";
      await userRef.doc(user.userId).set(user);
      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      var res = await FirebaseService.firebaseAuth
          .sendPasswordResetEmail(email: email);
      return true;
    } catch (err) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseService.firebaseAuth.signOut();
    } catch (err) {
      rethrow;
    }
  }

  Future<bool?> editEmail(
      {required UserModel user, required String userId}) async {
    try {
      final response = await userRef.doc(userId).set(user);
      return true;
    } catch (err) {
      return false;
    }
  }
}
