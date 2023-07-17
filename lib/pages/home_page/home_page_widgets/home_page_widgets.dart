import 'package:course_selling/common/constants/appimages.dart';
import 'package:course_selling/common/constants/appstrings.dart';
import 'package:course_selling/pages/home_page/home_page_blocs/home_Page_states.dart';
import 'package:course_selling/pages/home_page/home_page_blocs/home_page_blocs.dart';
import 'package:course_selling/pages/home_page/home_page_blocs/home_page_events.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/appcolors.dart';
import '../../../common/widgets/base_text_widget.dart';

AppBar buildHomePageAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset(AppImages.menuPng),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.person)),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text, {Color? color, double? top}) {
  return Container(
    margin: EdgeInsets.only(top: top ?? 2.h),
    child: Text(
      text,
      style: TextStyle(
          color: color ?? AppColors.primaryText,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(15.h),
          ),
          border: Border.all(
            color: AppColors.primaryFourthElementText,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset(AppImages.searchIcon),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: TextField(
                // onChanged: (value) => func!(value),
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: AppStrings.searchYourCourse,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      SizedBox(
        width: 5.w,
      ),
      GestureDetector(
        child: Container(
          height: 40.w,
          width: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(13.w),
            ),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset(
            AppImages.optionsIcon,
            color: AppColors.primaryElement,
          ),
        ),
      )
    ],
  );
}

//for sliders
Widget slidersView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            print('slider index is $value');
            context.read<HomePageBlocs>().add(
                  HomePageDots(value),
                );
          },
          children: [
            slidersContainer(imagePath: AppImages.artPng),
            slidersContainer(imagePath: AppImages.image1),
            slidersContainer(imagePath: AppImages.image2),
          ],
        ),
      ),
      SizedBox(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(20, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0.h),
            ),
          ),
        ),
      )
    ],
  );
}

Widget slidersContainer({String? imagePath}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.h),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          imagePath ?? AppImages.artPng,
        ),
      ),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText(AppStrings.chooseYourText),
            GestureDetector(
              onTap: () {},
              child: reusableText(
                AppStrings.seeAll,
                color: AppColors.primaryThirdElementText,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Popular",
                textColor: AppColors.primaryThirdElementText,
                backGroundColor: Colors.white),
            _reusableMenuText("Newest",
                textColor: AppColors.primaryThirdElementText,
                backGroundColor: Colors.white),
          ],
        ),
      )
    ],
  );
}

// for menu button reusable text

Widget _reusableMenuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color backGroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 15.w, right: 15.w),
    decoration: BoxDecoration(
      color: backGroundColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(
        color: backGroundColor,
      ),
    ),
    child: reusableText(
      menuText,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontSize: 11,
    ),
  );
}

Widget courseGridUi() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      image: const DecorationImage(
        image: AssetImage(AppImages.image1),
      ),
    ),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "It and Engineering Course",
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.left,
            softWrap: false,
            style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Flutter Course trial",
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.left,
            softWrap: false,
            style: TextStyle(
              color: AppColors.primaryFourthElementText,
              fontWeight: FontWeight.normal,
              fontSize: 11.sp,
            ),
          ),
        ]),
  );
}
