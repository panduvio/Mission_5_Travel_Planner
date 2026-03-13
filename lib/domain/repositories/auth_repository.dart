import 'package:dartz/dartz.dart';
import 'package:mission_5_wanderly/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> userLogin(String email, String password);
  Future<Either<Failure, String>> userRegister(String email, String password);
  Future<void> userLogout();
  Future<void> deleteAccount(String password);
}
