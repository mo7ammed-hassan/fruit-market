import 'package:fruit_market/core/services/app_storage.dart';
import 'package:fruit_market/features/auth/auth_injection.dart';
import 'package:fruit_market/features/home/home_injection.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  /// Storage
  getIt.registerLazySingleton<AppStorage>(() => AppStorage());

  registerAuthDependencies(getIt);

  registerHomeDependencies(getIt);
}
