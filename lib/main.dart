import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_zen/core/bindings/todo_zen_binding.dart';
import 'package:todo_zen/core/theme/app_theme.dart';
import 'package:todo_zen/firebase_options.dart';
import 'package:todo_zen/presentation/controllers/auth_controller.dart';
import 'package:todo_zen/routes/app_pages.dart';
import 'package:todo_zen/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController());
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: AppRoutes.splash,
      initialBinding: TodoZenBinding(),
      getPages: AppPages.routes,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final authController = Get.find<AuthController>();
    Future.delayed(Duration(seconds: 2)).whenComplete(() {
      if (authController.firebaseUser.value != null) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
