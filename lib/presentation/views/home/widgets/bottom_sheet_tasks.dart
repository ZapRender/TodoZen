import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:intl/intl.dart';
import 'package:todo_zen/core/theme/app_colors.dart';
import 'package:todo_zen/core/theme/app_text_theme.dart';
import 'package:todo_zen/data/models/task_model.dart';
import 'package:todo_zen/presentation/controllers/task_controller.dart';

class BottomSheetTasks extends StatelessWidget {
  BottomSheetTasks({super.key});

  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add Task', style: AppTextTheme.darkTextTheme.headlineMedium),
          TextField(
            controller: taskController.titleController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 18.0,
                color: AppColors.primaryTextDark.withValues(alpha: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: 'Tittle',
            ),
          ),
          TextField(
            controller: taskController.descriptionController,
            textCapitalization: TextCapitalization.sentences,
            maxLines: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 18.0,
                color: AppColors.primaryTextDark.withValues(alpha: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: 'Description',
            ),
          ),

          GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                taskController.dateController.text = DateFormat(
                  'yyyy-MM-dd',
                ).format(pickedDate);
              }
            },
            child: AbsorbPointer(
              child: TextField(
                controller: taskController.dateController,
                textCapitalization: TextCapitalization.sentences,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 18.0,
                    color: AppColors.primaryTextDark.withValues(alpha: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: 'Date',
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  final DateTime date = DateFormat(
                    'yyyy-MM-dd',
                  ).parse(taskController.dateController.text);
                  try {
                    final task = TaskModel(
                      id: '',
                      title: taskController.titleController.text,
                      description: taskController.descriptionController.text,
                      date: Timestamp.fromDate(date),
                    );
                    taskController.addTask(task);
                    Get.back();
                  } catch (e) {
                    Get.snackbar('Error: ', e.toString());
                  }
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.buttonColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
