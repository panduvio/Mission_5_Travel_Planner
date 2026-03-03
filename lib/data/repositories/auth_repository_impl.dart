import 'package:dartz/dartz.dart';
import 'package:mission_5_wanderly/core/errors/failure.dart';
import 'package:mission_5_wanderly/data/sources/auth_firebase.dart';
import 'package:mission_5_wanderly/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebase _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<Either<Failure, String>> userLogin(
    String email,
    String password,
  ) async {
    try {
      final response = await _authService.userLogin(email, password);
      final uid = response.user?.uid;

      if (uid == null) {
        return Left(AuthFailure('User UID not found.'));
      }

      return Right(uid);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, String>> userRegister(
    String email,
    String password,
  ) async {
    try {
      final response = await _authService.userRegister(email, password);
      final uid = response.user?.uid;

      return Right(uid!);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (_) {
      return Left(AuthFailure('Unexpected error occurred.'));
    }
  }
}
