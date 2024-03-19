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

  /// Builds the EmailInput widget.
  ///
  /// This method builds the EmailInput widget which consists of a Text widget
  /// displaying "What's is your email?" followed by a TextField for entering the
  /// email address. Finally, it includes a CustomButton widget that allows the
  /// user to switch to using a phone number.
  ///
  /// The [BuildContext] parameter [context] is used to access the [LoginProvider]
  /// in the widget tree.
  Widget build(BuildContext context) {
    // Build the EmailInput widget
    return Consumer<LoginProvider>(
      builder: (context, provider, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display "What's is your email?"
          Text(
            "What's is your email?",
            style: headerLarge,
          ),
          SizedBox(
            height: 25.h,
          ),
          // Build the TextField for entering the email address
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
          // Build the CustomButton for switching to using a phone number
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
