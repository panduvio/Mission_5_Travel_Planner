import 'package:mission_5_wanderly/domain/entities/user_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/user_repository.dart';

class SignupUsecase {
  UserRepository repository;

  SignupUsecase(this.repository);

  Future<bool> signup(UserEntity user) async {
    final isEmailRegistered = repository.signup(user);
    return isEmailRegistered;
  }
}
