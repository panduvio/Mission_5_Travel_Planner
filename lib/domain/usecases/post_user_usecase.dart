import 'package:mission_5_wanderly/domain/entities/user_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/user_repository.dart';

class PostUserUsecase {
  final UserRepository repository;

  PostUserUsecase(this.repository);

  Future<void> postUser(UserEntity user) async {
    await repository.postUser(user);
  }
}
