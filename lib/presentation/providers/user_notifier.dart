import 'package:get_it/get_it.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/domain/usecases/user_login_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/user_register_usecase.dart';
import 'package:mission_5_wanderly/presentation/widgets/custom_snackbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';
import 'package:mission_5_wanderly/presentation/providers/user_state.dart';

part 'user_notifier.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  final _userLoginUsecase = GetIt.I<UserLoginUsecase>();
  final _userRegisterUsecase = GetIt.I<UserRegisterUsecase>();

  @override
  UserState build() {
    return UserState();
  }

  Future<void> userLogin(String email, password) async {
    final result = await _userLoginUsecase.userLogin(email, password);

    result.fold(
      (failure) {
        CustomSnackbar.show(
          message: 'failure.message',
          icon: HeroIcons.xCircle,
        );
      },
      (user) async {
        state = state.copyWith(loginUser: user, message: 'Login Success');
        print('succeed');
      },
    );
  }

  Future<void> userRegister(UserEntity user, String password) async {
    final result = await _userRegisterUsecase.userRegister(user, password);

    result.fold(
      (failure) {
        state = state.copyWith(message: failure.message);
      },
      (unit) {
        state = state.copyWith(message: 'Signup Success');
      },
    );
  }
}
