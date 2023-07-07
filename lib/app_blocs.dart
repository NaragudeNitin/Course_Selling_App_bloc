import 'dart:developer';

import 'package:course_selling/app_events.dart';
import 'package:course_selling/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitState()) {
    log('App Bloc');
    on<Increment>((event, emit) {
      emit(AppStates(counter: state.counter + 1));
    });

    on<Decrement>((event, emit) {
      emit(AppStates(counter: state.counter - 1));
    });
  }
}
