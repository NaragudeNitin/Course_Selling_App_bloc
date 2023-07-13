import 'dart:developer';

import 'package:course_selling/pages/home_page/home_page_blocs/home_Page_states.dart';
import 'package:course_selling/pages/home_page/home_page_blocs/home_page_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBlocs() : super(const HomePageStates()) {
    log("Homepage bloc");
    on<HomePageDots>(_homePageDots);
  }
  void _homePageDots(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(event.index));
  }
}
