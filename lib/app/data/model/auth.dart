import 'package:json_annotation/json_annotation.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/auth.dart';

part 'auth.g.dart';

@JsonSerializable()
class AuthModel {
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'token_type')
  final String tokenType;
  final UserModel user;

  AuthModel({
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);

  AuthEntity toEntity() {
    return AuthEntity(
      id: user.id,
      name: user.name,
      email: user.email,
      token: accessToken,
    );
  }
}

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
