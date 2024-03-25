import 'package:flutter/material.dart';
import 'package:intimate/feature/presentation/pages/home/widgets/friends_button.dart';
import 'package:intimate/feature/presentation/pages/home/widgets/messages_button.dart';
import 'package:intimate/feature/presentation/pages/home/widgets/profile_button.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfileButton(),
        FriendsButton(),
        MessagesButton(),
      ],
    );
  }
}
