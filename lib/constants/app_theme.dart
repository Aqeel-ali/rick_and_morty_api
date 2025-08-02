import 'package:flutter/material.dart';
import 'my_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: MyColors.primary,
    scaffoldBackgroundColor: MyColors.backgroundLight,
    cardColor: MyColors.surfaceLight,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: MyColors.textPrimaryLight, fontSize: 20),
      bodyMedium: TextStyle(color: MyColors.textSecondaryLight, fontSize: 16),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: MyColors.primary,
      foregroundColor: MyColors.textPrimaryLight,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: MyColors.primary,
    scaffoldBackgroundColor: MyColors.backgroundDark,
    cardColor: MyColors.surfaceDark,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: MyColors.textPrimaryDark, fontSize: 20),
      bodyMedium: TextStyle(color: MyColors.textSecondaryDark, fontSize: 16),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: MyColors.primary,
      foregroundColor: MyColors.textPrimaryDark,
    ),
  );
}
