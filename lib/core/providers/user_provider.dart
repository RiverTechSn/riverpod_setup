import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:river_pod_settup/core/helpers/service_locator.dart';
import 'package:river_pod_settup/core/models/user_dto.dart';
import 'package:river_pod_settup/core/repositories/user_repository.dart';

part 'user_provider.g.dart';

@riverpod
Future<List<User>> users(Ref ref) {
  return getIt<UserRepository>().fetchUsers();
}

@riverpod
class CreateUser extends _$CreateUser {
  // initial state
  @override
  FutureOr<User?> build() => null;

  Future<void> create(User user) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => getIt<UserRepository>().createUser(user),
    );
  }
}
