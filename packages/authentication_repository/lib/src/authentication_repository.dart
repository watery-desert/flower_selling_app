import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'authentication_user.dart';

class SignUpFailure implements Exception {}

class LogInWithEmailAndPasswordFailure implements Exception {}

class SignOutFailure implements Exception {}

class AuthenticationRepository {
  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  Stream<AuthUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? AuthUser.empty : firebaseUser.toUser;
    });
  }

  Future<void> createUserWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseException catch (_) {
      throw SignUpFailure();
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseException catch (_) {
      throw LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> signOut() async {
    try {
      _firebaseAuth.signOut();
    } on Exception {
      throw SignOutFailure();
    }
  }

  Future<void> sendEmailVerification() async {
    await _firebaseAuth.currentUser?.sendEmailVerification();
  }
}

extension on firebase_auth.User {
  AuthUser get toUser {
    return AuthUser(
      userID: uid,
      email: email,
      name: displayName,
    );
  }
}
