import 'package:course_selling/common/constants/appcolors.dart';
import 'package:course_selling/pages/profile/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildProfileAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24.w),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profileIconAndEditButton(),
              SizedBox(height: 30.h),
              buildListView(context),
            ],
          ),
        ),
      ),
    );
  }
}
