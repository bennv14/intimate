import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/colors.dart';
import 'package:intimate/core/constants/styles.dart';
import 'package:intimate/feature/presentation/common_widgets/custom_button.dart';
import 'package:intimate/feature/presentation/pages/login/widgets/email_input.dart';
import 'package:intimate/feature/presentation/providers/login_provider.dart';
import 'package:provider/provider.dart';

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What's is your number?",
            style: headerLarge,
          ),
          SizedBox(
            height: 25.h,
          ),
          TextField(
            style: textStyle,
            onChanged: (value) => provider.phoneNumber = value,
            decoration: InputDecoration(
              fillColor: textFieldBG,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.r),
                ),
                borderSide: BorderSide.none,
              ),
              hintText: '',
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
              onTap: () => provider.content = const EmailInput(),
              child: Text(
                "Use email instead",
                style: textStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
