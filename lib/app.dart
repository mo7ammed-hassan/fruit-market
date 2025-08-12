import 'package:flutter/material.dart';
import 'package:fruit_market/config/routing/app_router.dart';
import 'package:fruit_market/core/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.appRouter,
    required this.initialRoute,
  });
  final AppRouter appRouter;
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: (settings) => appRouter.generateRoute(settings),
      initialRoute: initialRoute,
    );
  }
}
