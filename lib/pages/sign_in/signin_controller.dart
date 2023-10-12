import 'dart:developer';

import 'package:course_selling/common/constants/constant.dart';
import 'package:course_selling/common/entities/entities.dart';
import 'package:course_selling/common/widgets/flutter_toastw.dart';
import 'package:course_selling/global.dart';
import 'package:course_selling/pages/sign_in/signin_bloc/signin_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../common/apis/user_api.dart';

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
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            // log("User open_id = $id");
            // print("User PhotoUrl $photoUrl");
            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            //type 1 means email login
            loginRequestEntity.type = 1;
            print("111111111111111111111111111111111111111");

            asyncPostAllData(loginRequestEntity); //calling user Api from here

            // log('User exist');
            // we got verified user from firebase
            // Global.storageService
            //     .setString(AppConstants.STORAGE_USER_TOKEN_KEY, '12345678');
            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil("/application", (route) => false);
            log('User exist with user name in signin controller:::----->>>>> $user');
          } else {
            //we have error getting user from firebase
            toastInfo(msg: 'No such User found kindly register to app');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            // log('No user found with such email');
            toastInfo(msg: 'No user found with such email');
            return;
          } else if (e.code == 'wrong-password') {
            // log('Wrong password provided for user');
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

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.login(params: loginRequestEntity);
    print("22222222222222222222222");
    print(result.toString());
  }
}
