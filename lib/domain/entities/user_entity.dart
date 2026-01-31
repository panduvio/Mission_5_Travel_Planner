class UserEntity {
  final String email;
  final String password;
  final String fullName;
  final String gender;
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
    email: 'user@email.com',
    password: 'password',
    fullName: 'User Full Name',
    gender: 'Male',
    phone: '6281234567890',
  ),
];
