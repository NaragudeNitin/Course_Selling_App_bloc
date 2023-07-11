import 'package:course_selling/pages/register/register_bloc/register_bloc.dart';
import 'package:course_selling/pages/sign_in/signin_bloc/signin_blocs.dart';
import 'package:course_selling/pages/welcome_pages/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => AppBlocs(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBlocs(),
        ),
      ];
}
