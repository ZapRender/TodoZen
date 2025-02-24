import 'package:flutter/material.dart';
import 'package:todo_zen/core/theme/app_colors.dart';

class AppElevatedButtonTheme {
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primaryDark,
      disabledForegroundColor: Colors.white.withValues(alpha: 0.5),
      disabledBackgroundColor: AppColors.primaryDark.withValues(alpha: 0.5),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      textStyle: const TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  );
}
