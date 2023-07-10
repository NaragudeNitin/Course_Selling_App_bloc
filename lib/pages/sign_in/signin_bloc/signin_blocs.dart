import 'dart:developer';

import 'package:course_selling/pages/sign_in/signin_bloc/signin_event.dart';
import 'package:course_selling/pages/sign_in/signin_bloc/signin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    //on method can also be called as event handler
    // on<EmailEvent>((event, emit) {
    //   emit(state.copyWith(email: event.email));
    //   //email event madhe ji method create keliy ti call karaychi
    //   //ani tyala required parameter event madhun call karaycha
    // });
    //----------instead above lines we can write it as below---------

    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

    // pahili ji on<email event> chi method ahe tyala ek sepearate method
    //banvun jya kahi properties/functionlity dyaychya tya seperate deu shakto
  }
  //------event handlers body is defined here---------
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    // log('My email is ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    log('My password is ${event.password}');
    emit(state.copyWith(password: event.password));
  }
}
