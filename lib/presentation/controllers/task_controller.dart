import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_zen/core/services/firestore_service.dart';
import 'package:todo_zen/data/models/task_model.dart';

class TaskController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();
  var tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _firestoreService.getTask().listen((taskList) {
      tasks.value = taskList;
    });
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    super.onClose();
  }

  void setDate(DateTime date) {
    dateController.text = DateFormat('yyyy-MM-dd').format(date);
    update();
  }

  void addTask(TaskModel task) {
    _firestoreService.addTask(task);
  }

  void deleteTask(String id) {
    _firestoreService.deleteTask(id);
  }

  void toggleTaskStatus(TaskModel task) {
    _firestoreService.updateTask(
      TaskModel(
        id: task.id,
        title: task.title,
        description: task.description,
        date: task.date,
        isCompleted: !task.isCompleted,
      ),
    );
  }
}
