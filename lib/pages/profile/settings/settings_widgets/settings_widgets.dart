import 'package:course_selling/common/widgets/base_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/appimages.dart';

AppBar buildSetingsAppbar() {
  return AppBar(
    title: Container(
      child: Container(
        child: reusableText('Settings'),
      ),
    ),
  );
}

Widget settingsButton(BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Confirm logout",
            ),
            content: const Text("Confirm logout"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("cancel"),
              ),
              TextButton(
                onPressed: func,
                child: const Text("confirm"),
              ),
            ],
          );
        },
      );
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.logoutPng),
        ),
      ),
    ),
  );
}
