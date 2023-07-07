import 'dart:developer';

import 'package:course_selling/pages/welcome_pages/bloc/welcome_event.dart';
import 'package:course_selling/pages/welcome_pages/bloc/welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    log('welcome bloc');
    on<WelcomeEvents>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}


/**
 * what lazy bloc does
 * if you have only one bloc provider value of lazy doent matter
 * in general when we have multiple bloc only earlier one blocprovider will be generated first
 * if we put lazy of any bloc false then it will be generated first // within no time eg
 * 
 */

