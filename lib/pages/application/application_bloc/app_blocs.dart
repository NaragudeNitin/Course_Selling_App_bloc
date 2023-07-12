import 'dart:developer';

import 'package:course_selling/pages/application/application_bloc/app_events.dart';
import 'package:course_selling/pages/application/application_bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvent, AppStates> {
  AppBlocs() : super(const AppStates()) {
    on<TriggerApEvent>((event, emit) {
      log("My tapped index is${event.index}");
      emit(AppStates(index: event.index));
    });
  }
}
