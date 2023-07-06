import 'dart:developer';

import 'package:course_selling/pages/welcome_pages/bloc/welcome_bloc.dart';
import 'package:course_selling/pages/welcome_pages/bloc/welcome_event.dart';
import 'package:course_selling/pages/welcome_pages/bloc/welcome_state.dart';
import 'package:course_selling/themes/screen_constants/appstrings.dart';
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
                  onPageChanged: (value) {
                    log(value.toString());
                    state.page = value;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvents());
                  },
                  children: const [
                    Page(
                      index: 0,
                      buttonName: AppStrings.next,
                      title: AppStrings.firstSeeLearning,
                      subtitle: AppStrings.forgetABoutForAPap,
                      imagePath: 'this is  imahegb',
                    ),
                    Page(
                      index: 1,
                      buttonName: AppStrings.next,
                      title: AppStrings.connectWithEveryOne,
                      subtitle: AppStrings.alwaysKeepInTouch,
                      imagePath: 'this is  imahegb',
                    ),
                    Page(
                      index: 2,
                      buttonName: 'Get started',
                      title: AppStrings.alwaysFascinatedLear,
                      subtitle: AppStrings.anywereAnyTime,
                      imagePath: 'this is  imahegb',
                    ),
                  ],
                ),
                Positioned(
                  bottom: 70.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                        size: const Size.square(8.0),
                        activeSize: const Size(10.0, 8.0),
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
}

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.index,
    required this.buttonName,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.onPressed,
  });

  final int index;
  final String buttonName;
  final String title;
  final String subtitle;
  final String imagePath;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Text(imagePath),
        ),
        SizedBox(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
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
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 325.w,
          height: 50.h,
          margin: EdgeInsets.only(
            left: 25.w,
            right: 25.w,
            top: 50.h,
          ),
          decoration: BoxDecoration(
              color: Colors.blue,
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
      ],
    );
  }
}
