import 'package:get/get.dart';
import 'package:todo_zen/presentation/controllers/auth_controller.dart';
import 'package:todo_zen/routes/app_routes.dart';

class HomeController {
  var selectedIndex = 0.obs;
  final AuthController authController = Get.find<AuthController>();

  void onItemTapped(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        authController.logout();
        break;
      case 1:
        Get.toNamed(AppRoutes.history);
        break;
      default:
    }
  }
}
