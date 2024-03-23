import 'package:flutter/material.dart';
import 'package:intimate/feature/presentation/pages/sign_up/widgets/sign_up_body.dart';
import 'package:intimate/feature/presentation/providers/sign_up_provider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Callback function to unfocus the primary focus if there is any.
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ChangeNotifierProvider<SignUpProvider>(
        create: (context) => SignUpProvider(context),
        child: const SignUpBody(),
      ),
    );
  }
}
