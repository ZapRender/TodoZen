import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_zen/core/theme/app_colors.dart';
import 'package:todo_zen/core/theme/app_text_theme.dart';
import 'package:todo_zen/data/models/task_model.dart';
import 'package:todo_zen/presentation/controllers/task_controller.dart';
import 'package:todo_zen/routes/app_routes.dart';

class TasksItemList extends StatelessWidget {
  TasksItemList({super.key, required this.taskValue});
  final TaskModel taskValue;
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
      child: Card(
        color: AppColors.darkCard,
        child: ListTile(
          title: Text(
            taskValue.title,
            style: AppTextTheme.darkTextTheme.titleMedium,
          ),
          subtitle: Text('Date'),
          trailing: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            value: false,
            onChanged: (value) {
              taskController.toggleTaskStatus(taskValue);
            },
            activeColor: AppColors.primaryDark,
          ),
          onTap: () => Get.toNamed(AppRoutes.description, arguments: taskValue),
        ),
        
        
      ),
    );
  }
}
