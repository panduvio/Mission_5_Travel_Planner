import 'package:firebase_auth/firebase_auth.dart';
import 'package:mission_5_wanderly/core/errors/failure.dart';

abstract class AuthFirebase {
  Future<UserCredential> userLogin(String email, String password);
  Future<UserCredential> userRegister(String email, String password);
  Future<void> userLogout();
  Future<void> deleteAccount(String password);
}

class AuthFirebaseImpl implements AuthFirebase {
  final FirebaseAuth _firebaseAuth;

  AuthFirebaseImpl(this._firebaseAuth);

  @override
  Future<UserCredential> userLogin(String email, String password) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    }
  }

  @override
  Future<UserCredential> userRegister(String email, String password) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    }
  }

  @override
  Future<void> userLogout() async {
    await _firebaseAuth.signOut();
  }

  Failure _mapFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential': // Add this case
        return AuthFailure('Email or password incorrect.');
      case 'invalid-email':
        return AuthFailure('The email address is badly formatted.');
      case 'email-already-in-use':
        return AuthFailure('This email is already registered.');
      case 'network-request-failed':
        return AuthFailure('Check your internet connection.');
      default:
        return AuthFailure(e.message ?? 'Authentication failed.');
    }
  }

  @override
  Future<void> deleteAccount(String password) async {
    final user = _firebaseAuth.currentUser;

    if (user == null) {
      throw AuthFailure("No authenticated user");
    }

    try {
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );

      await user.reauthenticateWithCredential(credential);

      await user.delete();
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    }
  }
}
