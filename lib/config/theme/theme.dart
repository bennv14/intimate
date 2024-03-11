import 'package:flutter/material.dart';
import 'package:intimate/core/constants/colors.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: primarySwatchColor,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primarySwatchColor,
    ),
  );
}
