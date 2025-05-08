import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_zen/core/theme/app_colors.dart';
import 'package:todo_zen/core/theme/app_text_theme.dart';
import 'package:todo_zen/presentation/controllers/task_controller.dart';

class TaskDescriptionScreen extends StatelessWidget {
  TaskDescriptionScreen({super.key});

  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline, color: AppColors.error),
            onPressed: () {
              taskController.deleteTask(taskController.selectedTask.value.id);
              Get.back();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.darkBackground,
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: (){
  
              taskController.toggleTaskStatus(taskController.selectedTask.value);
              Get.back();
            },
            child: Text(
              taskController.selectedTask.value.isCompleted ? 'Mark as Incomplete' : 'Mark as Complete',
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
                    taskController.selectedTask.value.title,
                    style: AppTextTheme.darkTextTheme.headlineMedium,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 5),
                          Text(taskController.selectedTask.value.formattedDate),
                        ],
                      ),
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
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    taskController.selectedTask.value.description,
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
}
