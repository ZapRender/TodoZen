import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_zen/core/theme/app_text_theme.dart';
import 'package:todo_zen/presentation/controllers/task_controller.dart';
import 'package:todo_zen/presentation/views/home/widgets/task_item_list.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TodoZen',
          style: AppTextTheme.darkTextTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: taskController.tasks.length,
          itemBuilder: (context, index) {
            final task = taskController.tasks[index];
            return TasksItemList(task: task);
          },
        );
      }),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
