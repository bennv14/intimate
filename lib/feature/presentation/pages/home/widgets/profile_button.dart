import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intimate/feature/presentation/common_widgets/custom_button.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: 48.h,
      width: 48.w,
      padding: EdgeInsets.all(7.r),
      shape: BoxShape.circle,
      fillColor: grayButton,
      child: SvgPicture.asset(
        "assets/icons/profile-circle.svg",
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
