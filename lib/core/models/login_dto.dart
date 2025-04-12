import 'package:json_annotation/json_annotation.dart';
import 'package:river_pod_settup/core/models/user_dto.dart';
part 'login_dto.g.dart';

@JsonSerializable()
class LoginDto {
  final int? id;
  final String username;
  final String password;
  final User? user;
  LoginDto({
    this.id,
    required this.username,
    required this.password,
    this.user,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
}
