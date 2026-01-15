import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/config/router/route_action.dart';
import 'package:omnisuite_front_end/config/router/routes.dart';

extension RouterExtensions on BuildContext {
  /// Navigate to a specific screen based on the provided path.
  void navigateTo(String? path, {RouteAction routeAction = RouteAction.push}) {
    final screen = AppLink.getScreen(path);

    switch (routeAction) {
      case RouteAction.push:
        Navigator.push(
          this,
          MaterialPageRoute(builder: (context) => screen),
        );
        break;
      case RouteAction.replace:
        Navigator.pushReplacement(
          this,
          MaterialPageRoute(builder: (context) => screen),
        );
    }

  }

  /// Navigate to the splash screen.
  void navigateToSplash() {
    navigateTo(AppLink.splash);
  }

  void pushModal(
    BuildContext context,
    Widget child, {
    bool rootNavigator = false,
    Function? callBack,
  }) {
    var content = child;
    NavigatorState navigator;
    if (rootNavigator) {
      navigator = Navigator.of(context, rootNavigator: true);
    } else {
      navigator = Navigator.of(context);
    }

    navigator
        .push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animationIn, _) => SizedBox(
          width: 300,
          child: content,
        ),
        transitionDuration: Duration.zero,
      ),
    )
        .then((value) {
      if (callBack != null) {
        callBack(value);
      }
    });
  }

  void popModal(BuildContext context, {bool rootNavigator = false}) {
    // Temporarily maintaining Navigator usage to be replaced with updating
    // _pages array instead.

    final navigator = Navigator.of(context, rootNavigator: rootNavigator);
    if (navigator.canPop()) {
      navigator.pop();
    }
  }
}
