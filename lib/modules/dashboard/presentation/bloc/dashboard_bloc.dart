import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omnisuite_front_end/services/injectible.dart';
import 'package:omnisuite_front_end/services/shared_preferences/local_storage.dart';
import 'package:omnisuite_front_end/utils/network/log.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitialState()) {
    on<DashboardEvent>((event, emit) {});
    on<DashboardInitialEvent>(_onDashboardInitialEvent);
  }
  
  FutureOr<void> _onDashboardInitialEvent(DashboardInitialEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      final loggedInUserId = await serviceLocator<LocalStorage>()
          .getString(LocalStorageKey.loggedInUserId);
      final loggedInEmailId = await serviceLocator<LocalStorage>()
          .getString(LocalStorageKey.loggedInEmailId);

      if (loggedInUserId == null || loggedInEmailId == null) {
        emit(DashboardFailureState());
      } else {
        emit(DashboardSuccessState(
          emailId: loggedInEmailId,
        ));
      }
    } catch (e, st) {
      Log.error(
          "[ERROR] Caught Exception in _onDashboardInitialEvent: $e");
      emit(DashboardFailureState());
    }
  }
  
}