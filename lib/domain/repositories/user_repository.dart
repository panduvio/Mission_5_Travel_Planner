import 'package:dartz/dartz.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Unit> postUser(UserEntity user);
  Future<UserEntity> getUserById(String uid);
  Future<void> deleteUserData(String uid);
}
