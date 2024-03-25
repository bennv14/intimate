import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/constants.dart';
import 'package:intimate/feature/presentation/common_widgets/custom_button.dart';

class FriendsButton extends StatelessWidget {
  const FriendsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: 45.h,
      width: 126.w,
      borderRadius: BorderRadius.circular(51.sp),
      fillColor: grayButton,
    );
  }
}
