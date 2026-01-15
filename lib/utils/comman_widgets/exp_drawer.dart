import 'package:flutter/material.dart';

abstract class ExpDrawer extends StatefulWidget {
  /// The width to fill with the modal on tablet and desktop
  double? width;

  /// The height to fill with the modal on tablet and desktop
  final double height;

  /// The duration of the menu open animation
  final Duration openDuration;

  /// The background color
  final Color backgroundColor;

  /// Whether to expand the child widget to full width
  final bool isFullWidth;

  bool? isDesktop = true;

  ExpDrawer({
    super.key,
    required this.width,
    required this.height,
    this.openDuration = const Duration(milliseconds: 250),
    Color? backgroundColor,
    required this.isFullWidth,
    this.isDesktop = true,
  }) : backgroundColor = backgroundColor ?? Colors.black.withOpacity(0.5);
}

mixin ExpDrawerState<T extends ExpDrawer> on State<T> {
  var _isOpen = false;

  @override
  void initState() {
    super.initState();

    // Having trouble with AnimationController SlideTranstion so doing this temp as a workaround
    Future(() {
      setState(() {
        _isOpen = true;
      });
    });
  }

  Widget drawerContent({
    required Widget child,
    bool dismissOnTap = true,
    bool isRTLLanguage = false,
  }) {
    if (widget.isFullWidth) {
      return child;
    } else {
      return Stack(
        children: [
          if (dismissOnTap)
            GestureDetector(
              excludeFromSemantics: true,
              behavior: HitTestBehavior.translucent,
              onTapDown: (event) {},
              onPanUpdate: (update) {},
              onTap: _onBackgroundTapped,
            ),
          AnimatedPositioned(
            top: 0.0,
            left: isRTLLanguage
                ? _isOpen
                    ? 0
                    : -(widget.width ?? (widget.isDesktop == true ? 600 : 480))
                : null,
            right: isRTLLanguage
                ? null
                : _isOpen
                    ? 0
                    : -(widget.width ?? (widget.isDesktop == true ? 600 : 480)),
            duration: widget.openDuration,
            onEnd: _onAnimationEnd,
            child: SizedBox(
              child: child,
              width: widget.width ?? (widget.isDesktop == true ? 600 : 480),
              height: widget.height,
            ),
          ),
        ],
      );
    }
  }

  void onClosed() {}

  void _onAnimationEnd() {
    if (_isOpen) {
      return;
    }
    onClosed();
  }

  void _onBackgroundTapped() {
    performExitAnimation();
  }

  void performExitAnimation() {
    if (widget.isFullWidth) {
      onClosed();
      return;
    }

    setState(() {
      _isOpen = false;
    });
  }
}
