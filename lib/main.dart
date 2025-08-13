import 'package:flutter/material.dart';
import 'package:fruit_market/app.dart';
import 'package:fruit_market/config/routing/app_router.dart';
import 'package:fruit_market/config/routing/routes.dart';
import 'package:fruit_market/config/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDependencies();

  runApp(MainApp(appRouter: AppRouter(), initialRoute: Routes.splashScreen));
}
