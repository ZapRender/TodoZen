import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo_zen/presentation/views/home/home_screen.dart';
import 'package:todo_zen/presentation/views/login/login_screen.dart';
import 'package:todo_zen/presentation/views/register/register_screen.dart';
import 'package:todo_zen/presentation/views/task_description/task_description_screen.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/', page: () => HomeScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/register', page: () => RegisterScreen()),
    GetPage(name: '/profile', page: () => TaskDescriptionScreen()),
  ];
}
