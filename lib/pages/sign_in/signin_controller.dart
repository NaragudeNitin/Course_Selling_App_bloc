import 'dart:developer';

import 'package:course_selling/common/widgets/flutter_toastw.dart';
import 'package:course_selling/pages/sign_in/signin_bloc/signin_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({
    required this.context,
  });

  void handleSignIn(String type) async {
    try {
      if (type == 'email') {
        //BlocProvider.of<SignInBloc>(context).state;
        //is same as below
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: 'Email is empty, please Provide Valid Email');
          return;
        }
        if (password.isEmpty) {
          //
          toastInfo(msg: 'Password is empty, please Provide Valid Password');
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            // if credentals are nulll
            toastInfo(msg: 'User does not Exist');
            return;
          }
          if (!credential.user!.emailVerified) {
            //you havent verified your email
            toastInfo(msg: 'You need to verify your Email Account');
            return;
          }

          var user = credential.user;
          if (user != null) {
            //we got verified user from firebase
            log('User exist with user name $user');
          } else {
            //we have error getting user from firebase
            toastInfo(msg: 'No such User found kindly register to app');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            log('No user found with such email');
            toastInfo(msg: 'No user found with such email');
            return;
          } else if (e.code == 'wrong-password') {
            log('Wrong password provided for user');
            toastInfo(msg: 'Wrong password provided for user');
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'Your email address format is wrong');
            return;
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
