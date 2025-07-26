// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:omnisuite_front_end/modules/landing/presentation/page/landing_page.dart'
    as _i1;
import 'package:omnisuite_front_end/modules/pdf_analyzer/presentation/page/pdf_analyzer_page.dart'
    as _i2;
import 'package:omnisuite_front_end/modules/splash_screen.dart' as _i3;
import 'package:omnisuite_front_end/modules/text_model/presentation/page/text_model_page.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LandingPage(),
      );
    },
    PDFAnalyzerRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PDFAnalyzerPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashScreen(),
      );
    },
    TextModelRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TextModelPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LandingPage]
class LandingRoute extends _i5.PageRouteInfo<void> {
  const LandingRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PDFAnalyzerPage]
class PDFAnalyzerRoute extends _i5.PageRouteInfo<void> {
  const PDFAnalyzerRoute({List<_i5.PageRouteInfo>? children})
      : super(
          PDFAnalyzerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PDFAnalyzerRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TextModelPage]
class TextModelRoute extends _i5.PageRouteInfo<void> {
  const TextModelRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TextModelRoute.name,
          initialChildren: children,
        );

  static const String name = 'TextModelRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
