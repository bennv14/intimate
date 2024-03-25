import 'package:flutter/material.dart';
import 'package:intimate/feature/presentation/pages/home/home_page.dart';
import 'package:intimate/feature/presentation/pages/login/widgets/login_widgets.dart';

class LoginProvider extends ChangeNotifier {
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController phoneNumberController = TextEditingController();

  bool _isEnableBTN = false;
  bool _isLoginByEmail = true;

  Widget _content = const EmailLogin();

  late final BuildContext _context;

  LoginProvider(this._context) {
    emailController.addListener(emailListener);
    passwordController.addListener(passwordListener);
    phoneNumberController.addListener(phoneNumberListener);
  }

  String get email => emailController.text;
  void emailListener() {
    bool enable =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(emailController.text);
    if (enable != _isEnableBTN) {
      _isEnableBTN = enable;
      notifyListeners();
    }
  }

  String get password => passwordController.text;
  void passwordListener() {
    bool enable = passwordController.text.length >= 6;
    if (enable != _isEnableBTN) {
      _isEnableBTN = enable;
      notifyListeners();
    }
  }

  String get phoneNumber => phoneNumberController.text;
  void phoneNumberListener() {
    bool enable =
        RegExp(r'^(\+?\d{1,3}[- ]?)?\d{10}$').hasMatch(phoneNumberController.text);
    if (enable != _isEnableBTN) {
      _isEnableBTN = enable;
      notifyListeners();
    }
  }

  bool get isEnableBTN => _isEnableBTN;

  Widget get content => _content;
  set content(Widget value) {
    _content = value;
    notifyListeners();
    if (value is EmailLogin) {
      _isLoginByEmail = true;
    } else if (value is PhoneNumberLogin) {
      _isLoginByEmail = false;
    }
  }

  void doContinue() {
    if (_content is EmailLogin || _content is PhoneNumberLogin) {
      _content = const PasswordLogin();
      _isEnableBTN = false;
      notifyListeners();
    } else {
      Navigator.pushReplacement(
        _context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  void doBack() {
    if (_content is PasswordLogin) {
      if (_isLoginByEmail) {
        _content = const EmailLogin();
        emailListener();
        notifyListeners();
      } else {
        _content = const PhoneNumberLogin();
        passwordListener();
        notifyListeners();
      }
    } else {
      Navigator.of(_context).pop();
    }
  }

  void doForgotPassword() {}

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
