import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/colors.dart';
import 'package:intimate/core/constants/styles.dart';
import 'package:intimate/feature/presentation/common_widgets/custom_button.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override

  /// Widget that represents the password input field.
  ///
  /// It consists of a centered column with a text field and a button.
  /// The text field allows the user to input their password.
  /// The button allows the user to navigate to a password reset screen.
  Widget build(BuildContext context) {
    return Column(
      // Align the children of this column to the center horizontally and vertically.
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display a text with a header style.
        Text(
          "Enter your password",
          style: headerLarge,
        ),
        // Add spacing between widgets.
        SizedBox(
          height: 25.h,
        ),
        // Display a text field with a style and no onChanged callback.
        TextField(
          style: textStyle,
          onChanged: null,
          decoration: InputDecoration(
            // Set the background color and shape of the text field.
            fillColor: textFieldBG,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.r),
              ),
              borderSide: BorderSide.none,
            ),
            // Set the hint text and style of the text field.
            hintText: "Password",
            hintStyle: hintTextStyle,
          ),
        ),
        // Add spacing between widgets.
        SizedBox(
          height: 25.h,
        ),
        // Display a centered button with a style and no onTap callback.
        Center(
          child: CustomButton(
            fillColor: textFieldBG,
            borderRadius: BorderRadius.circular(22.r),
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 20.w,
            ),
            onTap: null,
            child: Text(
              "Forgot password",
              style: textStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
