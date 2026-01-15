import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:omnisuite_front_end/config/router/routes.dart';
import 'package:omnisuite_front_end/main.dart';
import 'package:omnisuite_front_end/services/injectible.dart';
import 'package:omnisuite_front_end/services/shared_preferences/local_storage.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: globalNavKey,
  // redirect: (context, state) async {
    // final token = await serviceLocator<LocalStorage>().getString(LocalStorageKey.accessToken);
    //
    // if (token == null) {
    //   return AppLink.splash;
    // }
    //
    // final isTokenExpired = Jwt.isExpired(token);
    //
    // if (isTokenExpired) {
    //   return AppLink.splash;
    // }
    //
    // if (state.path == AppLink.signIn) {
    //   return AppLink.splash;
    // }
    //
    // return state.path;
  // },
  initialLocation: AppLink.splash,
  routes: <RouteBase>[
    GoRoute(
      path: AppLink.splash,
      name: 'Splash',
      builder: (BuildContext context, GoRouterState state) {
        return AppLink.getScreen(state.path);
      },
    ),
    GoRoute(
      path: AppLink.signIn,
      name: 'Sign In',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          child: AppLink.getScreen(state.path),
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: AppLink.dashboard,
      name: 'Dashboard',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          child: AppLink.getScreen(state.path),
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: AppLink.textGeneration,
      name: 'Text Generation',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          child: AppLink.getScreen(state.path),
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
  ],
);
