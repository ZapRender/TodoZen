import 'package:get/get.dart';
import 'package:todo_zen/core/services/firestore_service.dart';
import 'package:todo_zen/data/models/task_model.dart';

class TaskController extends GetxController {
  final FirestoreService _firestoreService = FirestoreService();
  var taks = <TaskModel>[].obs;

  @override
  void onInit() {
    taks.bindStream(_firestoreService.getTask());
    super.onInit();
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
