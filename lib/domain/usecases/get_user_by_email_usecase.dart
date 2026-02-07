import 'package:mission_5_wanderly/domain/entities/user_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/user_repository.dart';

class GetUserByEmailUsecase {
  final UserRepository repository;

  GetUserByEmailUsecase(this.repository);

  Future<UserEntity> getUserByEmail(String email) async {
    final loginUser = await repository.getUserByEmail(email);
    return loginUser;
  }
}
