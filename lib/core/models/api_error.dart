import 'package:json_annotation/json_annotation.dart';
part 'api_error.g.dart';

@JsonSerializable()
class ApiError {
  final String code;
  final bool status;
  final List<String> message;

  ApiError({required this.code, required this.status, required this.message});

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}
