import 'package:mission_5_wanderly/domain/repositories/user_repository.dart';

class LoginUsecase {
  final UserRepository repository;

  LoginUsecase(this.repository);

  Future<String> login(String email, password) async {
    final loginMessage = repository.login(email, password);
    return loginMessage;
  }
}
