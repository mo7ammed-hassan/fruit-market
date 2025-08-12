import 'package:flutter/material.dart';
import 'package:fruit_market/config/routing/app_router.dart';

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
      onGenerateRoute: (settings) => appRouter.generateRoute(settings),
      initialRoute: initialRoute,
    );
  }
}
