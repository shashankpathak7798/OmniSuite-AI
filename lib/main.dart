import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omnisuite_front_end/config/env.dart';
import 'package:omnisuite_front_end/config/router/app_router.dart';
import 'package:omnisuite_front_end/services/locator.dart';
import 'package:omnisuite_front_end/utils/assets.dart';
import 'package:provider/provider.dart';

void main() {
  OpenAI.apiKey = EnvConfig.OPENAI_API_KEY;

  Animate.restartOnHotReload = true;

  if (kIsWeb) {
    setUrlStrategy(PathUrlStrategy());
  }

  initializeDependencies();
  runApp(FutureProvider<FragmentPrograms?>(
    create: (context) => loadFragmentPrograms(),
    initialData: null,
    builder: (context, snapshot) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'OmniSuite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.dancingScriptTextTheme(),
      ),
      routerConfig: appRouter.config(),
    );
  }
}
