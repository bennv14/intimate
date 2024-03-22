import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/colors.dart';
import 'package:intimate/core/constants/styles.dart';
import 'package:intimate/feature/presentation/common_widgets/custom_button.dart';
import 'package:intimate/feature/presentation/providers/login_provider.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (BuildContext context, LoginProvider provider, Widget? child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter your password",
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
            height: 25.h,
          ),
          Center(
            child: CustomButton(
              fillColor: textFieldBG,
              borderRadius: BorderRadius.circular(22.r),
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 20.w,
              ),
              onTap: provider.doForgotPassword,
              child: Text(
                "Forgot password",
                style: textStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
