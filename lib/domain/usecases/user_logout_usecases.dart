import 'package:mission_5_wanderly/domain/repositories/auth_repository.dart';

class UserLogoutUsecases {
  final AuthRepository repository;

  UserLogoutUsecases(this.repository);

  Future<void> userLogout() async {
    await repository.userLogout();
  }
}
