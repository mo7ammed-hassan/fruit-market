import 'package:flutter/material.dart';
import 'package:fruit_market/app.dart';
import 'package:fruit_market/config/routing/app_router.dart';
import 'package:fruit_market/config/service_locator.dart';

void main() async {
  initializeDependencies();

  // Entry Point
  final initialRoute = await AppRouter.getInitialRoute();
  runApp(MainApp(appRouter: AppRouter(), initialRoute: initialRoute));
}
