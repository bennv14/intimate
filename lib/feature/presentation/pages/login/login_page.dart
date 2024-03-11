import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intimate/core/constants/colors.dart';
import 'package:intimate/core/constants/styles.dart';
import 'package:intimate/feature/presentation/pages/login/widgets/login_widgets.dart';
import 'package:intimate/feature/presentation/common_widgets/custom_button.dart';
import 'package:intimate/feature/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

enum InputType { email, phoneNumber, password }

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String? _email;
  String? _phoneNumber;
  String? _password;
  bool _isEnable = false;
  late final AuthProvider _authProvider;
  InputType _inputType = InputType.email;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _authProvider = context.watch<AuthProvider>();
    super.didChangeDependencies();
  }

  void onChangeEmail(String email) {
    _email = email;
    if (_isEnable != checkInput()) {
      setState(() {
        _isEnable = checkInput();
      });
    }
  }

  void onChangePhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    if (_isEnable != checkInput()) {
      setState(() {
        _isEnable = checkInput();
      });
    }
  }

  void onChangePassword(String password) {
    _password = password;
    if (_isEnable != checkInput()) {
      setState(() {
        _isEnable = checkInput();
      });
    }
  }

  void changeInputType(InputType inputType) {
    if (_inputType == inputType) {
      return;
    }
    switch (_inputType) {
      case InputType.email:
        _email = null;
      case InputType.phoneNumber:
        _phoneNumber = null;
      case InputType.password:
        _password = null;
    }
    setState(() {
      _inputType = inputType;
      _isEnable = false;
    });
  }

  bool checkInput() {
    switch (_inputType) {
      case InputType.email:
        return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_email ?? '');
      case InputType.phoneNumber:
        return RegExp(r'[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
            .hasMatch(_phoneNumber ?? '');
      case InputType.password:
        return _password != null ? _password!.length >= 6 : false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            _buildBackButton(context),
            Expanded(
              child: _buildContent(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 53.w,
                vertical: 20.h,
              ),
              child: _buildTermOfService(),
            ),
            _buildContinueButton(),
          ],
        ),
      ),
    );
  }

  Container _buildContinueButton() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 44.h,
        left: 17.5.w,
        right: 17.5.w,
      ),
      alignment: Alignment.center,
      child: CustomButton(
        disable: false,
        onTap: () {
          if (_isEnable == false) {
            return;
          }
          if (_inputType == InputType.email || _inputType == InputType.phoneNumber) {
            setState(() {
              _inputType = InputType.password;
              _isEnable = false;
            });
          } else {
            setState(() {
              _inputType = InputType.email;
              _isEnable = false;
            });
          }
        },
        fillColor: _isEnable ? primaryColor : grayButton,
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
                color: _isEnable ? enableTextColor : disableTextColor,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.arrow_forward_rounded,
              color: _isEnable ? enableTextColor : disableTextColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermOfService() {
    return Text(
      "By tapping Continue, you are agreeing to our Terms of Service and Privacy Policy",
      style: textStyle.copyWith(fontSize: 13.sp),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: _inputType == InputType.email
          ? EmailInput(onChanged: onChangeEmail, changePage: changeInputType)
          : _inputType == InputType.phoneNumber
              ? PhoneNumberInput(
                  onChange: onChangePhoneNumber, changePage: changeInputType)
              : PasswordInput(onChange: onChangePassword, changePage: changeInputType),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 47.h, left: 17.w),
      child: CustomButton(
        height: 50.h,
        width: 50.w,
        shape: BoxShape.circle,
        fillColor: textFieldBG,
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        onTap: () {
          if (_inputType == InputType.password) {
            if (_email != null) {
              setState(() {
                _inputType = InputType.email;
              });
            } else {
              setState(() {
                _inputType = InputType.phoneNumber;
              });
            }
          }
        },
      ),
    );
  }
}
