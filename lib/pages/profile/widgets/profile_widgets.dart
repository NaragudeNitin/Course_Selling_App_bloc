import 'package:course_selling/common/constants/appcolors.dart';
import 'package:course_selling/common/constants/appimages.dart';
import 'package:course_selling/common/constants/appstrings.dart';
import 'package:course_selling/common/routes/names.dart';
import 'package:course_selling/common/widgets/base_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildProfileAppBar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset(AppImages.menuPng),
          ),
          reusableText('Profile'),
          SizedBox(
            width: 18.w,
            height: 16.h,
            child: Image.asset(
              AppImages.moreVertical,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    padding: EdgeInsets.only(right: 6.w),
    alignment: Alignment.bottomRight,
    height: 80.h,
    width: 80.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage(AppImages.headpicPng),
      ),
    ),
    child: Image.asset(
      AppImages.edit3,
      height: 25.h,
      width: 25.w,
    ),
  );
}

var imagesInfo = <String, String>{
  AppStrings.settings: AppImages.settings,
  AppStrings.paymentDetails: AppImages.creditCardPng,
  AppStrings.achievement: AppImages.awardpng,
  AppStrings.love: AppImages.heart1,
  AppStrings.learningReminders: AppImages.cube
};

//settings sections buttons
Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, AppRoutes.SETTINGS),
          child: SizedBox(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  width: 40.w,
                  height: 40.w,
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(imagesInfo.values.elementAt(index)),
                ),
                SizedBox(width: 15.w),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
