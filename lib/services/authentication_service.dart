import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';
import '../models/user/user_model.dart';
import 'firestore_service.dart';

class AuthenticationService {
  // firebase auth object
  final FirebaseAuth _authentication = FirebaseAuth.instance;

  // firebase auth object getter
  User? get currentUser => _authentication.currentUser;

  // authentication state change listener
  Stream<User?> get authStateChanges => _authentication.authStateChanges();

  // // get current user
  // Stream<UserModel?> get userModel {
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(currentUser?.uid)
  //       .snapshots()
  //       .map((snapshot) => UserModel.fromMap(snapshot));
  // }

  // sign up with email and password
  Future<Object> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String streetAddress,
    required String city,
    required String postalCode,
  }) async {
    try {
      var authResult = await _authentication.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        streetAddress: streetAddress,
        city: city,
        postalCode: int.parse(postalCode),
      );
      await locator<FirestoreService>().createUser(userModel);
      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }

  // log in with email and password
  Future<Object> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var authResult = await _authentication.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }

  // log out
  Future<void> signOut() async {
    try {
      return await _authentication.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
