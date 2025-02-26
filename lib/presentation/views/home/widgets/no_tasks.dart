import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_zen/core/theme/app_text_theme.dart';

class NoTasks extends StatelessWidget {
  const NoTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/no_tasks.svg'),
          Text(
            'What do you want to do today?',
            style: AppTextTheme.darkTextTheme.headlineSmall,
          ),
          Text(
            'Tab + to add a new task',
            style: AppTextTheme.darkTextTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
