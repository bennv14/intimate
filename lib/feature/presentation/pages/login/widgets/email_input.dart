import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/colors.dart';
import 'package:intimate/core/constants/styles.dart';
import 'package:intimate/feature/presentation/common_widgets/custom_button.dart';
import 'package:intimate/feature/presentation/pages/login/widgets/login_widgets.dart';
import 'package:intimate/feature/presentation/providers/login_provider.dart';
import 'package:provider/provider.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
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
          Center(
            child: CustomButton(
              fillColor: textFieldBG,
              borderRadius: BorderRadius.circular(22.r),
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 20.w,
              ),
              onTap: () => provider.content = const PhoneNumberInput(),
              child: Text(
                "Use phone number instead",
                style: textStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
