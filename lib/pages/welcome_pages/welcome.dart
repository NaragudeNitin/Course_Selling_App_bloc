import 'dart:developer';
import 'package:course_selling/common/constants/constant.dart';
import 'package:course_selling/global.dart';
import 'package:course_selling/pages/welcome_pages/bloc/welcome_bloc.dart';
import 'package:course_selling/pages/welcome_pages/bloc/welcome_event.dart';
import 'package:course_selling/pages/welcome_pages/bloc/welcome_state.dart';
import 'package:course_selling/common/constants/appcolors.dart';
import 'package:course_selling/common/constants/appimages.dart';
import 'package:course_selling/common/constants/appstrings.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) => Container(
            margin: const EdgeInsets.only(top: 30),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    log(value.toString());
                    state.page = value;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvents());
                  },
                  children: [
                    _page(
                      0,
                      context,
                      AppStrings.next,
                      AppStrings.firstSeeLearning,
                      AppStrings.forgetABoutForAPap,
                      AppImages.readingPng,
                    ),
                    _page(
                      1,
                      context,
                      AppStrings.getStarted,
                      AppStrings.alwaysFascinatedLear,
                      AppStrings.anywereAnyTime,
                      AppImages.boyPng,
                    ),
                    _page(
                      2,
                      context,
                      AppStrings.getStarted,
                      AppStrings.alwaysFascinatedLear,
                      AppStrings.anywereAnyTime,
                      AppImages.manPng,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 70.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                        color: AppColors.primaryThirdElementText,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(8.0),
                        activeSize: const Size(20.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subtitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subtitle,
            style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            //within 0-2 index
            if (index < 2) {
              index = index + 1;
              // animation
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              //jump to new page
              Global.storageService
                  .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/signIn', (route) => false);
            }
          },
          child: Container(
            width: 325.w,
            height: 50.h,
            margin: EdgeInsets.only(
              left: 25.w,
              right: 25.w,
              top: 50.h,
            ),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(3, 5),
                  ),
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
