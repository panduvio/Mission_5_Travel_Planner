import 'package:mission_5_wanderly/data/sources/user_hive.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserHive hive;

  UserRepositoryImpl(this.hive);

  @override
  Future<String> login(String email, password) async {
    final loginMessage = await hive.login(email, password);
    return loginMessage;
  }

  @override
  Future<bool> signup(UserEntity user) async {
    final isSignupSuccess = await hive.signup(user);
    return isSignupSuccess;
  }

  @override
  Future<UserEntity> getUserByEmail(String email) async {
    final user = await hive.getUserByEmail(email);
    return user;
  }
}
