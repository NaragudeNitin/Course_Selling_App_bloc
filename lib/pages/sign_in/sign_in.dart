import 'package:course_selling/pages/sign_in/signin_bloc/signin_blocs.dart';
import 'package:course_selling/pages/sign_in/signin_bloc/signin_event.dart';
import 'package:course_selling/pages/sign_in/signin_controller.dart';
import 'package:course_selling/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:course_selling/themes/screen_constants/appstrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/screen_constants/appimages.dart';
import 'signin_bloc/signin_states.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(child: reusableText(AppStrings.orUseYourEmail)),
                    Container(
                      margin: EdgeInsets.only(top: 50.h),
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText(AppStrings.email),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                            AppStrings.enterYourEmail,
                            'Email',
                            AppImages.userPng,
                            (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            },
                          ),
                          reusableText(AppStrings.password),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                            AppStrings.enterYourPassword,
                            'Password',
                            AppImages.lockIcon,
                            (value) {
                              context
                                  .read<SignInBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                        ],
                      ),
                    ),
                    forgotPassword(),
                    buildLoginAndRegiButton(AppStrings.logIn, 'login', () {
                      SignInController(context: context).handleSignIn("email");
                    }),
                    buildLoginAndRegiButton(AppStrings.register, 'regiser', () {
                      // SignInController(context: context)
                      //     .handleSignIn("password");
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
