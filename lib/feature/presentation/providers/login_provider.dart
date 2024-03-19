import 'package:flutter/material.dart';
import 'package:intimate/feature/presentation/pages/login/widgets/login_widgets.dart';

class LoginProvider extends ChangeNotifier {
  String? _email;
  String? _password;
  String? _phoneNumber;
  bool _isEnableBTN = false;
  Widget _content = const EmailInput();

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
    bool enable = RegExp(r'[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
        .hasMatch(_phoneNumber ?? '');
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
}
