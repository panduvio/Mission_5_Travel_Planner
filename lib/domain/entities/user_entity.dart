class UserEntity {
  final String email;
  final String uid;
  final String fullName;
  final String gender;
  final String phone;

  UserEntity({
    required this.email,
    required this.uid,
    required this.fullName,
    required this.gender,
    required this.phone,
  });

  UserEntity copyWith({
    String? uid,
    String? email,
    String? fullName,
    String? gender,
    String? phone,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
    );
  }
}
