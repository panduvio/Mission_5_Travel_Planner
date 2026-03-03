import 'package:firebase_auth/firebase_auth.dart';
import 'package:mission_5_wanderly/core/errors/failure.dart';

abstract class AuthFirebase {
  Future<UserCredential> userLogin(String email, password);
  Future<UserCredential> userRegister(String email, password);
}

class AuthFirebaseImpl implements AuthFirebase {
  final FirebaseAuth _firebaseAuth;

  AuthFirebaseImpl(this._firebaseAuth);

  @override
  Future<UserCredential> userLogin(String email, password) async {
    try {
      final response = _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    }
  }

  @override
  Future<UserCredential> userRegister(String email, password) {
    try {
      final response = _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    }
  }

  Failure _mapFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return AuthFailure('Email is not registered.');
      case 'wrong-password':
        return AuthFailure('Email or password is incorrect.');
      case 'invalid-email':
        return AuthFailure('Invalid email format.');
      case 'email-already-in-use':
        return AuthFailure('Email is already in use.');
      default:
        return AuthFailure('Authentication failed.');
    }
  }
}
