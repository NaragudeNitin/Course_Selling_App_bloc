import 'package:course_selling/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:course_selling/themes/screen_constants/appstrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/screen_constants/appimages.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
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
                      ),
                      reusableText(AppStrings.password),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                        AppStrings.enterYourPassword,
                        'Password',
                        AppImages.lockIcon,
                      ),
                    ],
                  ),
                ),
                forgotPassword(),
                buildLoginAndRegiButton(AppStrings.logIn, 'login'),
                buildLoginAndRegiButton(AppStrings.register, 'regiser'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
