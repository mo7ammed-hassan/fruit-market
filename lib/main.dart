import 'package:flutter/material.dart';
import 'package:fruit_market/app.dart';
import 'package:fruit_market/config/routing/app_router.dart';
import 'package:fruit_market/config/routing/routes.dart';
import 'package:fruit_market/config/service_locator.dart';
import 'package:fruit_market/core/services/app_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  // Initialize Shared Preferences & Storage
  await getIt.get<AppStorage>().init();

  runApp(MainApp(appRouter: AppRouter(), initialRoute: Routes.splashScreen));
}
