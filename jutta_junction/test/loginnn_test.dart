import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  Future<UserCredential> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to log in: ${e.message}');
    }
  }
}

class FirebaseService {
  static late FirebaseFirestore db;
  final FirebaseAuth firebaseAuth;

  FirebaseService({required this.firebaseAuth});

  static void init() {
    db = FirebaseFirestore.instance;
  }
}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  final email = 'ishu@gmail.com';
  final password = 'ishu12345';

  test('login', () async {
    final mockFirebaseAuth = MockFirebaseAuth();
    final mockUserCredential = MockUserCredential();
    final mockUser = MockUser();

    // Set up the mock UserCredential object.
    when(mockUserCredential.user).thenReturn(mockUser);

    // Set up the mock FirebaseAuth object.
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .thenAnswer((_) async => mockUserCredential);

    // Call the login function using the mock FirebaseAuth object.
    final AuthRepository authRepository =
        AuthRepository(firebaseAuth: mockFirebaseAuth);
    final UserCredential credential =
        await authRepository.login(email, password);

    // Check that the UserCredential object returned by the login function is not null.
    expect(credential.user, isNotNull);
  });
}

// Mock classes.
class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}
