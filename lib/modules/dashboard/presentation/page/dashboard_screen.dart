import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omnisuite_front_end/config/keys.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/views/dashboard_desktop_view.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/views/dashboard_mobile_view.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/services/injectible.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => serviceLocator<DashboardBloc>()..add(DashboardInitialEvent()),
        child: Responsive(key: AppKey().landingPageKey.responsivePageKey, mobile: const DashboardMobileView(), tablet: const DashboardDesktopView(), desktop: const DashboardDesktopView(),));
  }
}