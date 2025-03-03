import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_zen/core/theme/app_colors.dart';
import 'package:todo_zen/core/theme/app_text_theme.dart';
import 'package:todo_zen/data/models/task_model.dart';
import 'package:todo_zen/presentation/controllers/task_controller.dart';

class TaskDescriptionScreen extends StatelessWidget {
  TaskDescriptionScreen({super.key});

  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    final TaskModel taskValue = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline, color: AppColors.error),
            onPressed: () {
              _showDeleteConfirmationDialog(context, taskValue);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.darkBackground,
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: null,
            child: Text(
              'Mark as done',
              style: TextStyle(color: AppColors.primaryDark, fontSize: 16),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 27.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskValue.title,
                    style: AppTextTheme.darkTextTheme.headlineMedium,
                  ),
                  SizedBox(height: 15),

                  Card(
                    color: AppColors.darkCard,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      child: Text('Today'),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    taskValue.description,
                    style: TextStyle(color: AppColors.secondaryTextDark),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, TaskModel taskValue) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Task'),
          content: Text('Are you sure you want to delete this task?'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                taskController.deleteTask(taskValue.id);
                Get.back();
                Get.back();
              },
              child: Text('Delete', style: TextStyle(color: AppColors.error)),
            ),
          ],
        );
      },
    );
  }
}
