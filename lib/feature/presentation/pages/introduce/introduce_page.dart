import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/constants.dart';
import 'package:intimate/feature/presentation/common_widgets/custom_button.dart';
import 'package:intimate/feature/presentation/pages/login/login_page.dart';
import 'package:intimate/feature/presentation/pages/sign_up/sign_up_page.dart';

import '../../common_widgets/icon_title_app.dart';

class IntroducePage extends StatelessWidget {
  const IntroducePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // fancy header
            Expanded(
              child: Container(),
            ),
            const IconTitleApp(),
            SizedBox(height: 13.h),
            Text(
              "Live pics from your friends,\n on your home screen",
              textAlign: TextAlign.center,
              style: headerMedium,
            ),
            SizedBox(height: 35.h),
            CustomButton(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpPage()),
              ),
              borderRadius: BorderRadius.circular(18.sp),
              fillColor: primaryColor,
              height: 60.h,
              width: 196.w,
              child: Text(
                "Create an account",
                style: headerSmall.copyWith(color: darkTextColor),
              ),
            ),
            SizedBox(height: 22.h),
            CustomButton(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogInPage()),
              ),
              child: Text("Sign in", style: headerSmall),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
