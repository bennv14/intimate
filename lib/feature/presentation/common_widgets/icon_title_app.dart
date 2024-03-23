import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/constants.dart';

class IconTitleApp extends StatelessWidget {
  const IconTitleApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40.h,
          width: 40.w,
          child: Image.asset(
            "assets/icons/logo_border.png",
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 8.w),
        Text("Intimate", style: headerLarge.copyWith(fontSize: 37.sp)),
      ],
    );
  }
}
