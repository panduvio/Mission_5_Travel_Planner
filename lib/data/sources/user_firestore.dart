import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mission_5_wanderly/core/errors/failure.dart';
import 'package:mission_5_wanderly/data/models/user_model.dart';

abstract class UserFirestore {
  Future<UserModel> getUserById(String uid);
  Future<Unit> postUser(UserModel user);
}

class UserFirestoreImpl implements UserFirestore {
  final FirebaseFirestore _db;

  UserFirestoreImpl(this._db);

  final String _collection = 'users';

  @override
  Future<UserModel> getUserById(String uid) async {
    try {
      final snapshot = await _db.collection(_collection).doc(uid).get();

      if (!snapshot.exists) {
        throw UserFailure('User not found');
      }

      final user = UserModel.fromSnapshot(snapshot);
      return user;
    } catch (e) {
      throw UserFailure('Failed to fetch user data.');
    }
  }

  @override
  Future<Unit> postUser(UserModel user) async {
    try {
      // await _db.collection(_collection).add(user.toJson());
      await _db.collection(_collection).doc(user.uid).set(user.toJson());
      return unit;
    } catch (e) {
      throw UserFailure('Failed to post user');
    }
  }
}
