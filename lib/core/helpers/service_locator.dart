import 'package:get_it/get_it.dart';
import 'package:river_pod_settup/core/helpers/dio_clien.dart';
import 'package:river_pod_settup/core/helpers/shared.dart';
import 'package:river_pod_settup/core/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton(() => DioClient());
  getIt.registerLazySingleton(() => UserRepository(getIt<DioClient>()));
  getIt.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(await SharedPreferences.getInstance()),
  );
}
