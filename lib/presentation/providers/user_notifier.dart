import 'package:get_it/get_it.dart';
import 'package:mission_5_wanderly/domain/usecases/get_user_by_email_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';
import 'package:mission_5_wanderly/domain/usecases/login_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/signup_usecase.dart';
import 'package:mission_5_wanderly/presentation/providers/user_state.dart';

part 'user_notifier.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  final _loginUsecase = GetIt.I<LoginUsecase>();
  final _getUserByEmailUsecase = GetIt.I<GetUserByEmailUsecase>();
  final _signupUsecase = GetIt.I<SignupUsecase>();

  @override
  UserState build() {
    return UserState();
  }

  Future<String> login(String email, String password) async {
    final loginMessage = await _loginUsecase.login(email, password);

    if (loginMessage == 'Success') {
      final loginUser = await _getUserByEmailUsecase.getUserByEmail(email);
      print('Sampe login riverpod: ${loginUser.fullName}');
      state = state.copyWith(loginUser: loginUser);
    }

    return loginMessage;
  }

  Future<String> signup(UserEntity user) async {
    final isRegistered = await _signupUsecase.signup(user);

    if (!isRegistered) {
      return 'Email has already registered, please use another email';
    }

    return 'Signup Success';
  }
}
