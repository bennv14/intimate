import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  String? _email;
  String? _phoneNumber;
  String? _password;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) async {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get password => _password;
}
