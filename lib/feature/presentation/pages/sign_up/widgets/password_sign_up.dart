import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/constants.dart';
import 'package:intimate/feature/presentation/providers/sign_up_provider.dart';
import 'package:provider/provider.dart';

class PasswordSignUp extends StatelessWidget {
  const PasswordSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(
      builder: (context, provider, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Choose a password",
            style: headerLarge,
          ),
          SizedBox(
            height: 25.h,
          ),
          TextField(
            style: textStyle,
            onChanged: null,
            decoration: InputDecoration(
              fillColor: textFieldBG,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.r),
                ),
                borderSide: BorderSide.none,
              ),
              hintText: "Password",
              hintStyle: hintTextStyle,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          RichText(
            text: TextSpan(
              text: "Your password must be at least ",
              style: textStyle.copyWith(fontSize: 13.sp),
              children: [
                TextSpan(
                  text: "8 characters",
                  style: textStyle.copyWith(
                    color: primaryColor,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
