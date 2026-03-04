import 'package:mission_5_wanderly/domain/entities/user_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/user_repository.dart';

class GetUserByIdUsecase {
  final UserRepository repository;

  GetUserByIdUsecase(this.repository);

  Future<UserEntity> getUserById(String uid) async {
    final user = await repository.getUserById(uid);
    return user;
  }
}
