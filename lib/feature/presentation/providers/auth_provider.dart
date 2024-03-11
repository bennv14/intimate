import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isLogin = false;
  bool isLoading = false;
  User? user;
}
