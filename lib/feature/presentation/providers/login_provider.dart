import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intimate/feature/presentation/pages/introduce/introduce_page.dart';
import 'package:intimate/feature/presentation/pages/login/widgets/login_widgets.dart';

class LoginProvider extends ChangeNotifier {
  String? _email;
  String? _password;
  String? _phoneNumber;
  bool _isEnableBTN = false;
  Widget _content = const EmailInput();
  late final BuildContext _context;

  LoginProvider(this._context);

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

  set phoneNumber(String? value) {
    _phoneNumber = value;
    bool enable = RegExp(r'^(\+?\d{1,3}[- ]?)?\d{10}$').hasMatch(_phoneNumber ?? '');
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
    if (_content is EmailInput || _content is PhoneNumberInput) {
      _content = const PasswordInput();
      _isEnableBTN = false;
      notifyListeners();
    } else {
      log("Continue", name: "Click continue");
    }
  }

  void doBack() {
    if (_content is PasswordInput) {
      if (_email != null) {
        _content = const EmailInput();
        _isEnableBTN = false;
        notifyListeners();
      } else {
        _content = const PhoneNumberInput();
        _isEnableBTN = false;

        notifyListeners();
      }
    } else {
      Navigator.pushReplacement(
        _context,
        MaterialPageRoute(builder: (context) => const IntroducePage()),
      );
    }
  }

  void doForgotPassword() {}
}
