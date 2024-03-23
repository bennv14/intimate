import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/colors.dart';
import 'package:intimate/core/constants/styles.dart';
import 'package:intimate/feature/presentation/providers/sign_up_provider.dart';
import 'package:provider/provider.dart';

class EmailSignUp extends StatelessWidget {
  const EmailSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(
      builder: (context, provider, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What's is your email?",
            style: headerLarge,
          ),
          SizedBox(
            height: 25.h,
          ),
          TextField(
            style: textStyle,
            onChanged: (value) => provider.email = value,
            decoration: InputDecoration(
              fillColor: textFieldBG,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.r),
                ),
                borderSide: BorderSide.none,
              ),
              hintText: "Email address",
              hintStyle: hintTextStyle,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
