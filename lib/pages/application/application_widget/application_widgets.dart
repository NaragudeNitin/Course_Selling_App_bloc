import 'package:course_selling/pages/home_page/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/appcolors.dart';
import '../../../common/constants/appimages.dart';

Widget buildPage(int index) {
  List<Widget> _widget = const [
    HomePage(),
    Center(child: Text("Search")),
    Center(child: Text("Course")),
    Center(child: Text("Chat")),
    Center(child: Text("Profile")),
  ];
  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: 'Home',
    icon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset(AppImages.homeIcon),
    ),
    activeIcon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset(
        AppImages.homeIcon,
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'Search',
    icon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset(AppImages.search2Icon),
    ),
    activeIcon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset(
        AppImages.search2Icon,
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'course',
    icon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset(AppImages.playCircle1),
    ),
    activeIcon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset(
        AppImages.playCircle1,
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'chat',
    icon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset(AppImages.messageCircle),
    ),
    activeIcon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset(
        AppImages.messageCircle,
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'profile',
    icon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset(AppImages.person2),
    ),
    activeIcon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset(
        AppImages.person2,
        color: AppColors.primaryElement,
      ),
    ),
  ),
];
