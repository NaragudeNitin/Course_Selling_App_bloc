import 'dart:developer';

import 'package:course_selling/common/routes/names.dart';
import 'package:course_selling/global.dart';
import 'package:course_selling/pages/application/application_bloc/app_blocs.dart';
import 'package:course_selling/pages/home_page/home_page_blocs/home_page_blocs.dart';
import 'package:course_selling/pages/home_page/homepage.dart';
import 'package:course_selling/pages/register/register.dart';
import 'package:course_selling/pages/register/register_bloc/register_bloc.dart';
import 'package:course_selling/pages/sign_in/sign_in.dart';
import 'package:course_selling/pages/sign_in/signin_bloc/signin_blocs.dart';
import 'package:course_selling/pages/welcome_pages/bloc/welcome_bloc.dart';
import 'package:course_selling/pages/welcome_pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/application/application_page.dart';

class AppPages {
  static List<PageEntities> routes() {
    return [
      PageEntities(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntities(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntities(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBlocs(),
        ),
      ),
      PageEntities(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => AppBlocs(),
        ),
      ),
      PageEntities(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => HomePageBlocs(),
        ),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a mode; that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //checking for route name matching when navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          log('checking whether application is first time started and if it is started before it will take us to login screen');
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            log('If logged in is true then it will go to application page');
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        log('valid route name ${settings.name}, if app is launched first time it will show welcome page');
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    log('Invalid route name ${settings.name}');
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

//unify bloc provider and routes and pages
//this class is holding 3 objects
//using these three objects we are creating instance
//from that instance either we can either access bloc providers, routes names and related pages
class PageEntities {
  String route;
  Widget page;
  dynamic bloc;

  PageEntities({
    required this.route,
    required this.page,
    this.bloc,
  });
}
