import 'package:mission_5_wanderly/domain/repositories/auth_repository.dart';
import 'package:mission_5_wanderly/domain/repositories/user_repository.dart';

class DeleteAccountUsecase {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  DeleteAccountUsecase(this.authRepository, this.userRepository);

  Future<void> deleteAccount(String uid, String password) async {
    await authRepository.deleteAccount(password);
    await userRepository.deleteUserData(uid);
  }
}
