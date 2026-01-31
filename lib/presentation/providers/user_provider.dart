import 'package:flutter/material.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';

class UserProvider extends ChangeNotifier {
  final List<UserEntity> _activeUsers = userList;
  late UserEntity _loginUser;

  UserEntity get loginUser => _loginUser;

  void login(String email) {
    _loginUser = _activeUsers.firstWhere((user) => user.email == email);
  }

  void registerUser(UserEntity user) {
    _activeUsers.add(user);
    notifyListeners();
  }

  String checkUser(String email, String password) {
    final isEmailValid = _activeUsers.any((user) => user.email == email);

    if (isEmailValid) {
      final isPasswordValid = _activeUsers.any(
        (user) => user.password == password,
      );
      if (isPasswordValid) {
        return 'Success';
      }
      return 'Incorrect Password';
    }
    return 'Incorrect Email';
  }

  bool isEmailRegistered(String email) {
    return _activeUsers.any((user) => user.email == email);
  }
}
