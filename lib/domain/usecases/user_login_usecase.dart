import 'package:dartz/dartz.dart';
import 'package:mission_5_wanderly/core/errors/failure.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/auth_repository.dart';
import 'package:mission_5_wanderly/domain/repositories/user_repository.dart';

class UserLoginUsecase {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  UserLoginUsecase(this.authRepository, this.userRepository);

  Future<Either<Failure, UserEntity>> userLogin(
    String email,
    String password,
  ) async {
    final authResult = await authRepository.userLogin(email, password);

    return authResult.fold((failure) => Left(failure), (uid) async {
      final user = await userRepository.getUserById(uid);
      return Right(user);
    });
  }
}
