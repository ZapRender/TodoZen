import 'package:flutter/material.dart';
import 'package:todo_zen/core/theme/app_colors.dart';
import 'package:todo_zen/core/theme/app_elevated_button_theme.dart';
import 'package:todo_zen/core/theme/app_text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 16.0,
          color: AppColors.primaryDark,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
