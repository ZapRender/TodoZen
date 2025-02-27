import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:todo_zen/presentation/controllers/auth_controller.dart';
import 'package:todo_zen/presentation/controllers/task_controller.dart';

class TodoZenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => AuthController());
    Get.put(() => TaskController());
  }
}
