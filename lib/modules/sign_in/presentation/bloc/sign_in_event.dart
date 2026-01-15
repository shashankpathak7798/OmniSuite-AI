part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class TogglePasswordVisibilityEvent extends SignInEvent {}

class SignInUserEvent extends SignInEvent {}
