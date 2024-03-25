import 'package:flutter/material.dart';
import 'package:intimate/feature/presentation/pages/login/widgets/login_body.dart';
import 'package:intimate/feature/presentation/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override

  /// The widget that represents the Log In page of the application.
  ///
  /// This widget is responsible for building the Log In page UI. It uses the
  /// [GestureDetector] widget to detect taps on the screen and unfocuses the
  /// primary focus if there is any. It also uses the [ChangeNotifierProvider]
  /// widget to provide the [LoginProvider] instance to its child widgets.
  ///
  /// Returns a [GestureDetector] widget.
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(context),
      child: const LoginBody(),
    );
  }
}
