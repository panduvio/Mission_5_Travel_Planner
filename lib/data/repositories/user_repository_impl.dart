import 'package:dartz/dartz.dart';
import 'package:mission_5_wanderly/data/models/user_model.dart';
import 'package:mission_5_wanderly/data/sources/user_firestore.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserFirestore _firestore;

  UserRepositoryImpl(this._firestore);

  @override
  Future<UserEntity> getUserById(String uid) async {
    final userModel = await _firestore.getUserById(uid);
    final user = userModel.toEntity();
    return user;
  }

  @override
  Future<Unit> postUser(UserEntity user) async {
    final userModel = UserModel.fromEntity(user);
    await _firestore.postUser(userModel);
    return unit;
  }

  @override
  Future<void> deleteUserData(String uid) async {
    await _firestore.deleteUserData(uid);
  }
}
