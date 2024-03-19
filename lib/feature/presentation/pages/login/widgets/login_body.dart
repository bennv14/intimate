import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/constants.dart';
import 'package:intimate/feature/presentation/common_widgets/custom_button.dart';
import 'package:intimate/feature/presentation/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override

  /// The [build] method builds the UI of the [LoginBody] widget.
  ///
  /// It uses the [Consumer] widget to listen to changes in the [LoginProvider].
  /// Whenever the [LoginProvider] updates, it rebuilds the UI.
  ///
  /// The UI consists of a [Scaffold] widget with a [Column] as its body.
  /// The [Column] contains several widgets:
  /// - Back button: created by the [_buildBackButton] method.
  /// - Content Login:  which is a dynamic widget provided by the [LoginProvider.content]
  /// - Term of Service: created by the [_buildTermOfService] method.
  /// - Continue button: created by the [_buildContinueButton] method.

  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) {
        return Scaffold(
          body: Column(
            children: [
              _buildBackButton(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 27.w,
                    vertical: 20.h,
                  ),
                  child: loginProvider.content,
                ),
              ),
              _buildTermOfService(),
              _buildContinueButton(loginProvider),
            ],
          ),
        );
      },
    );
  }

  /// [_buildContinueButton] builds the continue button widget.
  ///
  /// This method takes a [LoginProvider] as a parameter and returns a [Container] widget.
  /// The container has a [CustomButton] as its child. The custom button has various properties
  /// such as [disable], [onTap], [fillColor], [borderRadius], [padding], and [child].
  /// The child of the custom button is a [Row] widget containing two children:
  /// - [Text] widget displaying the text "Continue".
  /// - [Icon] widget displaying the arrow forward icon.
  Widget _buildContinueButton(LoginProvider loginProvider) {
    // The continue button is built based on the state of the login provider.
    // If the login provider allows the button to be enabled, the button is enabled.
    // Otherwise, the button is disabled.
    return Container(
      margin: EdgeInsets.only(
        bottom: 44.h,
        left: 17.5.w,
        right: 17.5.w,
      ),
      alignment: Alignment.center,
      child: CustomButton(
        // Disable the button if the login provider does not allow it.
        disable: !loginProvider.isEnableBTN,
        onTap: () {},
        // The fill color of the button is determined by the loginProvider.
        fillColor: loginProvider.isEnableBTN ? primaryColor : grayButton,
        // The border radius of the button.
        borderRadius: BorderRadius.circular(50.r),
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 20.w,
        ),
        // The child of the button is a row containing two widgets:
        // - Text widget displaying the text "Continue".
        // - Icon widget displaying the arrow forward icon.
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Continue",
              style: headerMedium.copyWith(
                // The color of the text is determined by the loginProvider.
                color: loginProvider.isEnableBTN ? enableTextColor : disableTextColor,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.arrow_forward_rounded,
              // The color of the icon is determined by the loginProvider.
              color: loginProvider.isEnableBTN ? enableTextColor : disableTextColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermOfService() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 53.w, vertical: 20.h),
      child: Text(
        "By tapping Continue, you are agreeing to our Terms of Service and Privacy Policy",
        style: textStyle.copyWith(fontSize: 13.sp),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Builds a widget that represents the back button.
  ///
  /// The back button is a container with a circular shape and an icon.
  /// Tapping on the button doesn't do anything.
  Widget _buildBackButton() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 47.h, left: 17.w),
      // Build the back button widget.
      child: CustomButton(
        height: 50.h,
        width: 50.w,
        shape: BoxShape.circle,
        fillColor: textFieldBG,
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        onTap: () {},
      ),
    );
  }
}
