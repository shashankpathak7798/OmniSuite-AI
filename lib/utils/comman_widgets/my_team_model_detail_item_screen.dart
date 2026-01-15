import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/config/router/router_extensions.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/exp_drawer.dart';

import 'package:provider/provider.dart';

class V3ModalDetailsItemScreen extends StatefulWidget implements ExpDrawer {
  @override
  final Color backgroundColor;

  @override
  final double height;

  @override
  final bool isFullWidth;

  @override
  final Duration openDuration;

  @override
  double? width;

  @override
  bool? isDesktop;

  final Widget child;

  final bool useScrollViewForMobile;

  final String? title;
  final Function()? onTapped;

  final Key? mobileBackButtonKey;

  final bool dismissOnBackgroundTap;

  final VoidCallback? onClosed;

  V3ModalDetailsItemScreen({
    super.key,
    this.dismissOnBackgroundTap = true,
    this.mobileBackButtonKey,
    this.width,
    this.isDesktop,
    this.onTapped,
    required this.height,
    required this.child,
    this.openDuration = const Duration(milliseconds: 250),
    Color? backgroundColor,
    required this.isFullWidth,
    this.useScrollViewForMobile = true,
    this.title,
    this.onClosed,
  }) : backgroundColor = backgroundColor ?? Colors.black.withValues(alpha: 0.5);

  @override
  State<V3ModalDetailsItemScreen> createState() => _V3ModalDetailsItemScreenState();
}

class ModalDetailsDismissManager extends ChangeNotifier {
  void performExitAnimation() {
    notifyListeners();
  }
}

class _V3ModalDetailsItemScreenState extends State<V3ModalDetailsItemScreen> with ExpDrawerState<V3ModalDetailsItemScreen> {
  final modalDetailsDismissManager = ModalDetailsDismissManager();

  @override
  void initState() {
    modalDetailsDismissManager.addListener(_onExitAnimationRequest);
    super.initState();
  }

  @override
  void dispose() {
    modalDetailsDismissManager.removeListener(_onExitAnimationRequest);
    super.dispose();
  }

  void _onExitAnimationRequest() {
    performExitAnimation();
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (Responsive.isMobile(context)) {
      content = Scaffold(
        backgroundColor: widget.backgroundColor,
        // appBar: Responsive.isMobile(context)
        //     ? MobileAppBar(
        //         centerTitle: true,
        //         title: widget.title ?? s.flqaDetailsModalDetails,
        //         showBackButton: true,
        //         onTap: () {
        //           widget.onTapped?.call() ?? _onBackPressed();
        //         })
        //     : null,
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: (widget.useScrollViewForMobile)
                      ? SingleChildScrollView(
                          child: widget.child,
                        )
                      : widget.child,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      content = Scaffold(
        backgroundColor: widget.backgroundColor,
        extendBodyBehindAppBar: true,
        // appBar: Responsive.isMobile(context)
        //     ? MobileAppBar(
        //         centerTitle: true,
        //         title: widget.title ?? s.flqaDetailsModalDetails,
        //         showBackButton: true,
        //         onTap: () {
        //           widget.onTapped?.call() ?? _onBackPressed();
        //         })
        //     : null,
        body: SafeArea(
          bottom: false,
          child: drawerContent(
            dismissOnTap: widget.dismissOnBackgroundTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: widget.child,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return ChangeNotifierProvider<ModalDetailsDismissManager>(
      create: (_) => modalDetailsDismissManager,
      child: content,
    );
  }

  void _onBackPressed() {
    onClosed();
  }

  @override
  void onClosed() {
    context.popModal(context);
    widget.onClosed?.call();
  }
}
