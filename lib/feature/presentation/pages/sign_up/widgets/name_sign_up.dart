import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/feature/presentation/providers/sign_up_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/constants.dart';

class NameSignUp extends StatelessWidget {
  const NameSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(
      builder: (context, provider, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "What's your name?",
            style: headerLarge,
          ),
          SizedBox(
            height: 25.h,
          ),
          TextField(
            controller: provider.nameController,
            onSubmitted: (value) {
              if (provider.isEnableBTN) {
                provider.doContinue();
              }
            },
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            style: textStyle,
            decoration: InputDecoration(
              fillColor: textFieldBG,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.r),
                ),
                borderSide: BorderSide.none,
              ),
              hintText: "Name",
              hintStyle: hintTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
