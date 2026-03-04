import 'package:dartz/dartz.dart';
import 'package:mission_5_wanderly/core/errors/failure.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/auth_repository.dart';
import 'package:mission_5_wanderly/domain/repositories/user_repository.dart';

class UserRegisterUsecase {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  UserRegisterUsecase(this.authRepository, this.userRepository);

  Future<Either<Failure, Unit>> userRegister(
    UserEntity user,
    String password,
  ) async {
    final result = await authRepository.userRegister(user.email, password);

    return result.fold((failure) => Left(failure), (uid) async {
      final updatedUser = user.copyWith(uid: uid);
      await userRepository.postUser(updatedUser);
      return Right(unit);
    });
  }
}
