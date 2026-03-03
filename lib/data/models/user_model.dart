import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uid;
  final String email;
  final String fullName;
  final String gender;
  final String phone;

  const UserModel({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.gender,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel.fromJson(data).copyWith(uid: snapshot.id);
  }

  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      email: email,
      fullName: fullName,
      gender: gender,
      phone: phone,
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      fullName: user.fullName,
      gender: user.gender,
      phone: user.phone,
    );
  }

  UserModel copyWith({
    String? uid,
    String? email,
    String? fullName,
    String? gender,
    String? phone,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
    );
  }
}
