import 'package:get_it/get_it.dart';
import 'package:mission_5_wanderly/domain/usecases/delete_account_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/user_login_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/user_logout_usecases.dart';
import 'package:mission_5_wanderly/domain/usecases/user_register_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';
import 'package:mission_5_wanderly/presentation/providers/user_state.dart';

part 'user_notifier.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  final _userLoginUsecase = GetIt.I<UserLoginUsecase>();
  final _userLogoutUsecase = GetIt.I<UserLogoutUsecases>();
  final _userRegisterUsecase = GetIt.I<UserRegisterUsecase>();
  final _deleteAccount = GetIt.I<DeleteAccountUsecase>();

  @override
  UserState build() => UserState();

  Future<void> userLogin(String email, String password) async {
    state = state.copyWith(isLoading: true, message: '');

    final result = await _userLoginUsecase.userLogin(email, password);

    result.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, message: failure.message),
      (user) => state = state.copyWith(
        isLoading: false,
        loginUser: user,
        message: 'Login Success',
      ),
    );
  }

  Future<void> userLogout() async {
    await _userLogoutUsecase.userLogout();
    state = state.copyWith(isLoading: true, message: '');
  }

  Future<void> userRegister(UserEntity user, String password) async {
    state = state.copyWith(isLoading: true, message: '');

    final result = await _userRegisterUsecase.userRegister(user, password);

    result.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, message: failure.message),
      (unit) =>
          state = state.copyWith(isLoading: false, message: 'Signup Success'),
    );
  }

  Future<void> deleteAccount(String uid, String password) async {
    await _deleteAccount.deleteAccount(uid, password);
  }
}
