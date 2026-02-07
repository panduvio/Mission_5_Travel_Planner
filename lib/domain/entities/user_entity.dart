import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 2)
class UserEntity {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String fullName;
  @HiveField(3)
  final String gender;
  @HiveField(4)
  final String phone;

  UserEntity({
    required this.email,
    required this.password,
    required this.fullName,
    required this.gender,
    required this.phone,
  });
}

List<UserEntity> userList = [
  UserEntity(
    email: 'user@gmail.com',
    password: 'password',
    fullName: 'User Full Name',
    gender: 'Male',
    phone: '6281234567890',
  ),
];
