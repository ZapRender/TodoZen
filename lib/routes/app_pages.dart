import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo_zen/main.dart';
import 'package:todo_zen/presentation/views/home/home_screen.dart';
import 'package:todo_zen/presentation/views/login/login_screen.dart';
import 'package:todo_zen/presentation/views/register/register_screen.dart';
import 'package:todo_zen/presentation/views/task_description/task_description_screen.dart';
import 'package:todo_zen/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),
    GetPage(name: AppRoutes.register, page: () => RegisterScreen()),
    GetPage(name: AppRoutes.description, page: () => TaskDescriptionScreen()),
  ];
}
