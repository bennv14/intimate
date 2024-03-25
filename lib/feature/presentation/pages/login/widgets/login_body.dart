import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/constants.dart';
import 'package:intimate/feature/presentation/common_widgets/custom_button.dart';
import 'package:intimate/feature/presentation/providers/login_provider.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/terms_of_service.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) {
        return Scaffold(
          body: Column(
            children: [
              _buildBackButton(loginProvider),
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

  Widget _buildContinueButton(LoginProvider loginProvider) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 44.h,
        left: 17.5.w,
        right: 17.5.w,
      ),
      alignment: Alignment.center,
      child: CustomButton(
        disable: !loginProvider.isEnableBTN,
        onTap: loginProvider.doContinue,
        fillColor: loginProvider.isEnableBTN ? primaryColor : grayButton,
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
                color: loginProvider.isEnableBTN ? darkTextColor : grayTextColor,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.arrow_forward_rounded,
              color: loginProvider.isEnableBTN ? darkTextColor : grayTextColor,
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

  Widget _buildBackButton(LoginProvider provider) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 47.h, left: 17.w),
      child: CustomButton(
        height: 45.h,
        width: 45.h,
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
