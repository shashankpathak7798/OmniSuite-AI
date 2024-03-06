// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:omnisuite_front_end/modules/landing/presentation/page/landing_page.dart'
    as _i1;
import 'package:omnisuite_front_end/modules/splash_screen.dart' as _i2;
import 'package:omnisuite_front_end/modules/text_model/presentation/page/text_model_page.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LandingPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    TextModelRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.TextModelPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LandingPage]
class LandingRoute extends _i4.PageRouteInfo<void> {
  const LandingRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TextModelPage]
class TextModelRoute extends _i4.PageRouteInfo<void> {
  const TextModelRoute({List<_i4.PageRouteInfo>? children})
      : super(
          TextModelRoute.name,
          initialChildren: children,
        );

  static const String name = 'TextModelRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
