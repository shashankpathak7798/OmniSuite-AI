import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omnisuite_front_end/modules/sign_in/data/models/sign_in_request_model.dart';
import 'package:omnisuite_front_end/modules/sign_in/domain/usecases/sign_in_use_case.dart';
import 'package:omnisuite_front_end/services/injectible.dart';
import 'package:omnisuite_front_end/utils/network/data_state.dart';
import 'package:omnisuite_front_end/utils/network/log.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  bool obscurePassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignInBloc() : super(SignInInitialState()) {
    on<SignInEvent>(
      (event, emit) {},
    );

    on<TogglePasswordVisibilityEvent>(_onTogglePasswordVisibilityEvent);
    on<SignInUserEvent>(_onSignInUserEvent);
  }

  FutureOr<void> _onTogglePasswordVisibilityEvent(
      TogglePasswordVisibilityEvent event, Emitter<SignInState> emit) async {
    obscurePassword = !obscurePassword;

    emit(SignInInitialState());
  }

  FutureOr<void> _onSignInUserEvent(
      SignInUserEvent event, Emitter<SignInState> emit) async {
    try {
      emit(SignInLoadingState());

      if (formKey.currentState?.validate() ?? false) {
        final response = await serviceLocator<SignInUseCase>().loginUser(
          signInRequestModel: SignInRequestModel(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
        if (response is DataSuccess<bool>) {
          if (response.data == true) {
            emit(SignInSuccessState());
          }
          emit(SignInFailureState());
        } else {
          emit(SignInFailureState());
        }
      } else {
        emit(SignInFailureState());
      }
    } catch (e, st) {
      Log.error("[EXCEPTION] Caught Exception in _onSignInUserEvent: $e");
      emit(SignInFailureState());
    }
  }
}
