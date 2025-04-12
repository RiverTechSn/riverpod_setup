// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usersHash() => r'f2bce93fbc51bd40ed9a468b2e511c7b89ebb6eb';

/// See also [users].
@ProviderFor(users)
final usersProvider = AutoDisposeFutureProvider<List<User>>.internal(
  users,
  name: r'usersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$usersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UsersRef = AutoDisposeFutureProviderRef<List<User>>;
String _$createUserHash() => r'64492465e9642a021e6d83ce2c16b39db5236c1d';

/// See also [CreateUser].
@ProviderFor(CreateUser)
final createUserProvider =
    AutoDisposeAsyncNotifierProvider<CreateUser, User?>.internal(
      CreateUser.new,
      name: r'createUserProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$createUserHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CreateUser = AutoDisposeAsyncNotifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
