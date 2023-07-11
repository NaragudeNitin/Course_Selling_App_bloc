import 'package:course_selling/pages/bloc_providers.dart';
import 'package:course_selling/pages/register/register.dart';
import 'package:course_selling/pages/sign_in/my_home_page.dart';
import 'package:course_selling/pages/sign_in/sign_in.dart';
import 'package:course_selling/pages/welcome_pages/welcome.dart';
import 'package:course_selling/themes/screen_constants/appcolors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: AppColors.primaryText,
                )),
            useMaterial3: true,
          ),
          home: const Welcome(),
          routes: {
            "myHomePage": (context) => const MyHomePage(),
            "signIn": (context) => const SignIn(),
            "register": (context) => const Register(),
          },
        ),
      ),
    );
  }
}
