part of "splash_bloc.dart";

abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashFailureState extends SplashState {}

class SplashSuccessState extends SplashState {
  final String? emailId;

  SplashSuccessState({this.emailId});
}
