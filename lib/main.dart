import 'package:flutter/material.dart';
import 'package:todo_zen/core/theme/app_theme.dart';
import 'package:todo_zen/presentation/views/home/home_screen.dart';
import 'package:todo_zen/presentation/views/login/login_screen.dart';
import 'package:todo_zen/presentation/views/register/register_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, //Change when light theme is ready
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: HomeScreen(),
    );
  }
}
