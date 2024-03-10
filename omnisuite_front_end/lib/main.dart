import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/config/env.dart';
import 'package:omnisuite_front_end/config/router/app_router.dart';
import 'package:omnisuite_front_end/services/locator.dart';

void main() {
  OpenAI.apiKey = EnvConfig.OPENAI_API_KEY;

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
