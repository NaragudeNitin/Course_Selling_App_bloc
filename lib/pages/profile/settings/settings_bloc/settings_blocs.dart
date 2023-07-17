import 'dart:developer';

import 'package:course_selling/pages/profile/settings/settings_bloc/settings_events.dart';
import 'package:course_selling/pages/profile/settings/settings_bloc/settings_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingsStates> {
  SettingsBlocs() : super(const SettingsStates()) {
    log('Settings Bloc');
    on(_triggersetiings);
  }

  void _triggersetiings(SettingsEvents events, Emitter<SettingsStates> emit) {
    emit(const SettingsStates());
  }
}
