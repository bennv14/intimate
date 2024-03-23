import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intimate/feature/presentation/pages/login/widgets/login_widgets.dart';
import 'package:intimate/feature/presentation/pages/sign_up/widgets/email_sign_up.dart';
import 'package:intimate/feature/presentation/pages/sign_up/widgets/password_sign_up.dart';

class SignUpProvider extends ChangeNotifier {
  String? _email;
  String? _password;
  bool _isEnableBTN = false;
  Widget _content = const EmailSignUp();
  late final BuildContext _context;

  SignUpProvider(this._context);

  String? get email => _email;
  set email(String? value) {
    _email = value;
    bool enable = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_email ?? '');
    if (enable != _isEnableBTN) {
      _isEnableBTN = enable;
      notifyListeners();
    }
  }

  String? get password => _password;
  set password(String? value) {
    _password = value;
    bool enable = _password != null ? _password!.length >= 6 : false;
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
  }

  void doContinue() {
    if (_content is EmailSignUp) {
      _content = const PasswordSignUp();
      _isEnableBTN = false;
      notifyListeners();
    } else {
      log("Continue", name: "Click continue");
    }
  }

  void doBack() {
    if (_content is PasswordLogin) {
      if (_email != null) {
        _content = const EmailSignUp();
        _isEnableBTN = false;
        notifyListeners();
      } else {
        _content = const PhoneNumberLogin();
        _isEnableBTN = false;

        notifyListeners();
      }
    } else {
      Navigator.of(_context).pop();
    }
  }

  void doForgotPassword() {}
}
