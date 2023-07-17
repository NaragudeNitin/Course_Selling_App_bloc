import 'dart:developer';

import 'package:course_selling/common/constants/appcolors.dart';
import 'package:course_selling/common/constants/constant.dart';
import 'package:course_selling/common/routes/names.dart';
import 'package:course_selling/global.dart';
import 'package:course_selling/pages/application/application_bloc/app_blocs.dart';
import 'package:course_selling/pages/application/application_bloc/app_events.dart';
import 'package:course_selling/pages/profile/settings/settings_bloc/settings_blocs.dart';
import 'package:course_selling/pages/profile/settings/settings_bloc/settings_states.dart';
import 'package:course_selling/pages/profile/settings/settings_widgets/settings_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    //to set the index of bottom bar to zero we have to call
    //appbloc here so that afterlogging out it should come to index 1

    context.read<AppBlocs>().add(TriggerApEvent(0));

    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    log("Logged Out successfully");
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSetingsAppbar(),
      backgroundColor: AppColors.primaryBackground,
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingsStates>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(context, removeUserData),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
