import 'package:hive/hive.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';

class UserHive {
  final Box _userBox;

  UserHive(this._userBox);

  Future<String> login(String email, String password) async {
    if (!_userBox.containsKey(email)) {
      return 'Incorrect Email';
    }

    final UserEntity user = _userBox.get(email);

    if (user.password != password) {
      return 'Incorrect Password';
    }

    return 'Success';
  }

  Future<UserEntity> getUserByEmail(String email) async {
    final user = await _userBox.get(email);
    return user;
  }

  Future<bool> signup(UserEntity user) async {
    if (_userBox.containsKey(user.email)) {
      return false;
    }
    print('Sampe hive: ${user.fullName}');

    await _userBox.put(user.email, user);
    return true;
  }
}
