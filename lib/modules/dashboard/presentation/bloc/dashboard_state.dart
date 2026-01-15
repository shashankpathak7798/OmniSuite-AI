part of 'dashboard_bloc.dart';

abstract class DashboardState {}

class DashboardInitialState extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardFailureState extends DashboardState {}

class DashboardSuccessState extends DashboardState {
  final String? emailId;

  DashboardSuccessState({this.emailId});
}
