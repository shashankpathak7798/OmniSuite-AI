import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omnisuite_front_end/services/injectible.dart';
import 'package:omnisuite_front_end/services/shared_preferences/local_storage.dart';
import 'package:omnisuite_front_end/utils/network/log.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  Alignment orbAlignment = Alignment.center;
  Size? orbSize;
  bool isGetStartedVisible = true;

  SplashBloc() : super(SplashInitialState()) {
    on<SplashEvent>(
      (event, emit) {},
    );
    on<CheckUserValidityAndGetDetailsEvent>(
        _onCheckUserValidityAndGetDetailsEvent);
  }

  FutureOr<void> _onCheckUserValidityAndGetDetailsEvent(
      CheckUserValidityAndGetDetailsEvent event,
      Emitter<SplashState> emit) async {
    try {
      emit(SplashLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      final loggedInUserId = await serviceLocator<LocalStorage>()
          .getString(LocalStorageKey.loggedInUserId);
      final loggedInEmailId = await serviceLocator<LocalStorage>()
          .getString(LocalStorageKey.loggedInEmailId);

      if (loggedInUserId == null || loggedInEmailId == null) {
        emit(SplashFailureState());
      } else {
        emit(SplashSuccessState(
          emailId: loggedInEmailId,
        ));
      }
    } catch (e, st) {
      Log.error(
          "[ERROR] Caught Exception in _onCheckUserValidityAndGetDetailsEvent: $e");
      emit(SplashFailureState());
    }
  }
}
