import 'dart:developer';

import 'package:course_selling/pages/register/register_bloc/register_event.dart';
import 'package:course_selling/pages/register/register_bloc/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBlocs() : super(const RegisterStates()) {
    log('Register Bloc');
    on<UsernameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }

  void _userNameEvent(UsernameEvent event, Emitter<RegisterStates> emit) {
    log('User name event: ${event.userName}');
    emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    log('email event: ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    log('password event: ${event.password}');
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<RegisterStates> emit) {
    log('Confirm password event: ${event.confirmPassword}');
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
