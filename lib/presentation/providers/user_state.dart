import 'package:mission_5_wanderly/domain/entities/user_entity.dart';

class UserState {
  final UserEntity? loginUser;
  final String message;

  UserState({this.loginUser, this.message = ''});

  UserState copyWith({UserEntity? loginUser, String? loginMessage}) {
    return UserState(
      loginUser: loginUser ?? this.loginUser,
      message: loginMessage ?? message,
    );
  }
}
