import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/config/router/app_router.dart';
import 'package:omnisuite_front_end/services/locator.dart';

void main() {
  initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'OmniSuite',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}