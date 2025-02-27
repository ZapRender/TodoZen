import 'package:flutter/material.dart';
import 'package:todo_zen/core/theme/app_colors.dart';
import 'package:todo_zen/core/theme/app_text_theme.dart';

class TasksItemList extends StatelessWidget {
  const TasksItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
      child: Card(
        color: AppColors.darkCard,
        child: ListTile(
          title: Text(
            'Task title',
            style: AppTextTheme.darkTextTheme.titleMedium,
          ),
          subtitle: Text('Date'),
          trailing: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            value: false,
            onChanged: null,
            activeColor: AppColors.primaryDark,
          ),
        ),
      ),
    );
  }
}
