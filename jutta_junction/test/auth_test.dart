import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jutta_junction/models/user_model.dart';
import 'package:jutta_junction/repositories/auth_repository.dart';
import 'package:jutta_junction/services/firebase_service.dart';

void main() {
  late AuthRepository authRepository;
  final user = UserModel(
      username: 'test_username',
      email: 'test@test.com',
      password: 'test_password');
// Set up Firebase for testing
  setUp(() async {
    FirebaseService.db = FirebaseFirestore.instance;
    FirebaseService.firebaseAuth = FirebaseAuth.instance;
    authRepository = AuthRepository();
  });

// Test user registration
  test('register user', () async {
    await authRepository.register(user);

    final querySnapshot = await FirebaseService.db
        .collection('users')
        .where('username', isEqualTo: user.username)
        .get();

    expect(querySnapshot.docs.length, 1);
  });
// Test user login
  test('login user', () async {
    final UserCredential credential =
        await authRepository.login(user.email!, user.password!);
// Check if user is not null
    expect(credential.user, isNotNull);
  });

//
  test('get user details', () async {
    final UserModel? userDetail =
        await authRepository.getUserDetail(user.userId!);

    expect(userDetail, isNotNull);
  });
// Test password reset
  test('reset password', () async {
    final bool success = await authRepository.resetPassword(user.email!);

// Check if password has been reset successfully
    expect(success, isTrue);
  });
// Test editing user email
  test('edit user email', () async {
    final bool? success = await authRepository.editEmail(
        user: user.copyWith(email: 'ishu@gmail.com'), userId: user.userId!);
// Check if email has been edited successfully
    expect(success, isTrue);
  });
// Test user logout
  test('logout user', () async {
    await authRepository.logout();
// Check if user has been logged out successfully
    final currentUser = FirebaseService.firebaseAuth.currentUser;

    expect(currentUser, isNull);
  });
}
