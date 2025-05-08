import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_zen/core/services/firestore_service.dart';
import 'package:todo_zen/core/theme/app_colors.dart';
import 'package:todo_zen/data/models/task_model.dart';

class TaskController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();
  var tasks = <TaskModel>[].obs;
  var tasksPending = <TaskModel>[].obs;
  var selectedTask = TaskModel(
    id: '',
    title: '',
    description: '',
    date: Timestamp.now(),
    isCompleted: false,
  ).obs;

  void selectTask(TaskModel task) {
    selectedTask.value = task;
  }

  @override
  void onInit() {
    _firestoreService.getTasks().listen((taskList){
      tasks.value = taskList;
      tasksPending.value = taskList.where((task) => !task.isCompleted).toList();
    });

  
    super.onInit();
  }

  @override
  void onClose() {
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

  void clearFields() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  void toggleTaskStatus(TaskModel task) {
    _firestoreService.updateTask(
      TaskModel(
        id: task.id,
        title: task.title,
        description: task.description,
        date: task.date,
        isCompleted: !(task.isCompleted),
      ),
    );
  }

  void validateAndAddTask() {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        dateController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields', backgroundColor: AppColors.error);
      return;
    }

    try {
      final DateTime date = DateFormat('yyyy-MM-dd').parse(dateController.text);
      final task = TaskModel(
        id: '',
        title: titleController.text,
        description: descriptionController.text,
        date: Timestamp.fromDate(date),
      );
      addTask(task);
      clearFields();
      Get.back();
    } catch (e) {
      Get.snackbar('Error: ', e.toString());
    }
  }
}
