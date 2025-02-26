import 'package:flutter/material.dart';
import 'package:todo_zen/core/theme/app_theme.dart';
import 'package:todo_zen/presentation/views/task_description/task_description_screen.dart';

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
      home: TaskDescriptionScreen(),
    );
  }
}
