import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/constants.dart';
import 'package:intimate/feature/presentation/common_widgets/custom_button.dart';
import 'package:intimate/feature/presentation/common_widgets/terms_of_service.dart';
import 'package:intimate/feature/presentation/providers/sign_up_provider.dart';
import 'package:provider/provider.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Column(
            children: [
              _buildBackButton(provider),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 27.w,
                    vertical: 20.h,
                  ),
                  child: provider.content,
                ),
              ),
              _buildTermOfService(),
              _buildContinueButton(provider),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContinueButton(SignUpProvider provider) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 44.h,
        left: 17.5.w,
        right: 17.5.w,
      ),
      alignment: Alignment.center,
      child: CustomButton(
        disable: !provider.isEnableBTN,
        onTap: provider.doContinue,
        fillColor: provider.isEnableBTN ? primaryColor : grayButton,
        borderRadius: BorderRadius.circular(50.r),
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 20.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Continue",
              style: headerMedium.copyWith(
                color: provider.isEnableBTN ? darkTextColor : grayTextColor,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.arrow_forward_rounded,
              color: provider.isEnableBTN ? darkTextColor : grayTextColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermOfService() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 53.w, vertical: 20.h),
      child: const TermsOfService(),
    );
  }

  Widget _buildBackButton(SignUpProvider provider) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 47.h, left: 17.w),
      child: CustomButton(
        height: 50.h,
        width: 50.w,
        shape: BoxShape.circle,
        fillColor: textFieldBG,
        onTap: provider.doBack,
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
      ),
    );
  }
}
