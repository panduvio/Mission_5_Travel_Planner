import 'package:mission_5_wanderly/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<String> login(String email, password);
  Future<UserEntity> getUserByEmail(String email);
  Future<bool> signup(UserEntity user);
}
