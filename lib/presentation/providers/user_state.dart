import 'package:mission_5_wanderly/domain/entities/user_entity.dart';

class UserState {
  final UserEntity? loginUser;
  final String message;
  final bool isLoading;

  UserState({this.loginUser, this.message = '', this.isLoading = false});

  UserState copyWith({
    UserEntity? loginUser,
    String? message,
    bool? isLoading,
  }) {
    return UserState(
      loginUser: loginUser ?? this.loginUser,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
