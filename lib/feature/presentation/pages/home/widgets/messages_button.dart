import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/constants.dart';
import 'package:intimate/feature/presentation/common_widgets/custom_button.dart';

class MessagesButton extends StatelessWidget {
  const MessagesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: 45.h,
      width: 45.h,
      shape: BoxShape.circle,
      fillColor: grayButton,
      child: const Icon(
        Icons.message,
        color: Colors.white,
      ),
    );
  }
}
