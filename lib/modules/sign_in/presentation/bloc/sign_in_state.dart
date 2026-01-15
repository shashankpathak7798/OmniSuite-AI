part of 'sign_in_bloc.dart';

abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInFailureState extends SignInState {}

class SignInSuccessState extends SignInState {}
