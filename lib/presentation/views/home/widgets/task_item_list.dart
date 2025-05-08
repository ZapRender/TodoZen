import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_zen/core/theme/app_colors.dart';
import 'package:todo_zen/core/theme/app_text_theme.dart';
import 'package:todo_zen/data/models/task_model.dart';
import 'package:todo_zen/presentation/controllers/task_controller.dart';

class TasksItemList extends StatefulWidget {
  final TaskModel task;
  const TasksItemList({super.key, required this.task});

  @override
  State<TasksItemList> createState() => _TasksItemListState();
}

class _TasksItemListState extends State<TasksItemList> {
  bool isAnimating = false;
  final TaskController taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      transform:
          isAnimating
              ? Matrix4.translationValues(0, -80, 0)
              : Matrix4.identity(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
        child: Card(
          color: AppColors.darkCard,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () async {
              await Future.delayed(const Duration(milliseconds: 300));

              taskController.selectTask(widget.task);
              Get.toNamed('/taskDescription');
            },

            child: ListTile(
              title: Text(
                widget.task.title,
                style: AppTextTheme.darkTextTheme.titleMedium,
              ),
              subtitle: Text(widget.task.formattedDate),
              trailing: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                value: widget.task.isCompleted,
                onChanged: (value) async {
                  setState(() {
                    isAnimating = true;
                  });

                  await Future.delayed(const Duration(milliseconds: 300));

                  taskController.toggleTaskStatus(widget.task);

                  setState(() {
                    isAnimating = false;
                  });
                },
                activeColor: AppColors.primaryDark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
