import 'package:flutter/material.dart';
import 'package:intimate/core/constants/constants.dart';

class TermsOfService extends StatelessWidget {
  const TermsOfService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "By tapping Continue, you are agreeing to our ",
        style: textSmallStyle,
        children: <TextSpan>[
          TextSpan(
            text: "Terms of Service",
            style: textSmallStyle.copyWith(
              color: primaryColor,
            ),
          ),
          TextSpan(
            text: " and ",
            style: textSmallStyle,
          ),
          TextSpan(
            text: "Privacy Policy",
            style: textSmallStyle.copyWith(
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
