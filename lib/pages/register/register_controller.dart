import 'package:course_selling/common/constants/constant.dart';
import 'package:course_selling/common/widgets/flutter_toastw.dart';
import 'package:course_selling/pages/register/register_bloc/register_bloc.dart';
import 'package:course_selling/common/constants/appstrings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;

  RegisterController({required this.context});

  void handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if (userName.isEmpty) {
      toastInfo(msg: AppStrings.usernameCanNotEm);
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: AppStrings.emailCanNotEmp);
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: AppStrings.passwordCanNotEm);
      return;
    }
    if (confirmPassword.isEmpty) {
      toastInfo(msg: AppStrings.confPassCanNotEmp);
      return;
    }
    if (password != confirmPassword) {
      toastInfo(msg: AppStrings.passwordDoesNotMatches);
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        String photoUrl = "${AppConstants.SERVER_API_URL}uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(
          msg:
              'An Email has been sent to registerd email. To Activate it please check email box and click o link',
        );
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'Email Already in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your Email is invalid");
      }
    }
  }
}
