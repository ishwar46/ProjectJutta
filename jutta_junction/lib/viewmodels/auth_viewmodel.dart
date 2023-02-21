import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Dashboard/Product.dart';
import '../models/user_model.dart';
import '../repositories/auth_repository.dart';
import '../services/firebase_service.dart';

class AuthViewModel with ChangeNotifier {
  User? _user = FirebaseService.firebaseAuth.currentUser;

  User? get user => _user;

  UserModel? _loggedInUser;
  UserModel? get loggedInUser => _loggedInUser;

  Future<void> login(String email, String password) async {
    try {
      var response = await AuthRepository().login(email, password);
      print(response);
      _user = response.user;
      print("VM " " " + _user.toString());
      _loggedInUser = await AuthRepository().getUserDetail(_user!.uid);
      print("VM " " " + _loggedInUser.toString());
      notifyListeners();
    } catch (err) {
      print(err);
      // AuthRepository().logout();
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await AuthRepository().resetPassword(email);
      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }

  Future<void> register(UserModel user) async {
    try {
      var response = await AuthRepository().register(user);
      _user = response!.user;
      _loggedInUser = await AuthRepository().getUserDetail(_user!.uid);
      notifyListeners();
    } catch (err) {
      AuthRepository().logout();
      rethrow;
    }
  }

  Future<void> checkLogin() async {
    try {
      _loggedInUser = await AuthRepository().getUserDetail(_user!.uid);
      notifyListeners();
    } catch (err) {
      _user = null;
      AuthRepository().logout();
      rethrow;
    }
  }

  Future<void> editMyEmail(UserModel user, String userId) async {
    try {
      await AuthRepository().editEmail(user: user, userId: userId);
      // await AuthRepository().getUserDetail(_user!.uid);
      notifyListeners();
    } catch (e) {}
  }

  Future<void> logout() async {
    try {
      await AuthRepository().logout();
      _user = null;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }



}

