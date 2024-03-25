import 'package:flutter/material.dart';
import 'package:intimate/feature/presentation/pages/home/home_page.dart';
import 'package:intimate/feature/presentation/pages/login/widgets/login_widgets.dart';
import 'package:intimate/feature/presentation/pages/sign_up/widgets/email_sign_up.dart';
import 'package:intimate/feature/presentation/pages/sign_up/widgets/name_sign_up.dart';
import 'package:intimate/feature/presentation/pages/sign_up/widgets/password_sign_up.dart';

class SignUpProvider extends ChangeNotifier {
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController nameController = TextEditingController();
  bool _isEnableBTN = false;
  Widget _content = const EmailSignUp();
  late final BuildContext _context;

  SignUpProvider(this._context) {
    emailController.addListener(emailListener);
    passwordController.addListener(passwordListener);
    nameController.addListener(nameListener);
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

  String get name => nameController.text;
  void nameListener() {
    bool enable = nameController.text.isNotEmpty;
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
    } else if (_content is PasswordSignUp) {
      _content = const NameSignUp();
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
      _content = const EmailSignUp();
      emailListener();
      notifyListeners();
    } else {
      Navigator.of(_context).pop();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
