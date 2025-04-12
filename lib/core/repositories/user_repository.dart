import 'package:dio/dio.dart';
import 'package:river_pod_settup/core/helpers/dio_clien.dart';
import 'package:river_pod_settup/core/models/user_dto.dart';

import '../models/api_error.dart';

class UserRepository {
  final DioClient _client;

  UserRepository(this._client);

  Future<List<User>> fetchUsers() async {
    try {
      final response = await _client.dio.get('/users');
      return (response.data as List).map((e) => User.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ApiError.fromJson(e.response?.data);
    }
  }

  Future<User> createUser(User user) async {
    try {
      final response = await _client.dio.post('/users', data: user.toJson());
      return User.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiError.fromJson(e.response?.data);
    }
  }
}
