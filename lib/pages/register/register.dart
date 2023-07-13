import 'package:course_selling/pages/register/register_bloc/register_bloc.dart';
import 'package:course_selling/pages/register/register_bloc/register_event.dart';
import 'package:course_selling/pages/register/register_bloc/register_states.dart';
import 'package:course_selling/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/appimages.dart';
import '../../common/constants/appstrings.dart';
import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(AppStrings.signUp),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: reusableText(AppStrings.enterYourDetailsBelow)),
                    Container(
                      margin: EdgeInsets.only(top: 60.h),
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText(AppStrings.userName),
                          buildTextField(
                            AppStrings.enterYourUserName,
                            'name',
                            AppImages.userPng,
                            (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(UsernameEvent(value));
                            },
                          ),
                          reusableText(AppStrings.email),
                          buildTextField(
                            AppStrings.enterYourEmailAd,
                            'email',
                            AppImages.userPng,
                            (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(EmailEvent(value));
                            },
                          ),
                          reusableText(AppStrings.password),
                          buildTextField(
                            AppStrings.enterYourPassword,
                            'Password',
                            AppImages.lockIcon,
                            (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          reusableText(AppStrings.confirmPassword),
                          buildTextField(
                            AppStrings.confirmPassword,
                            'Password',
                            AppImages.lockIcon,
                            (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(ConfirmPasswordEvent(value));
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 24.w),
                      child: reusableText(AppStrings.bycreatingAccountYouAgree),
                    ),
                    buildLoginAndRegiButton(AppStrings.signUp, 'login', () {
                      // Navigator.pushNamed(context, "register");
                      RegisterController(context: context)
                          .handleEmailRegister();
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
