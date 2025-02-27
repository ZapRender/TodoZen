import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_zen/core/services/firebase_auth_service.dart';
import 'package:todo_zen/routes/app_routes.dart';

class AuthController extends GetxController {
  final FirebaseAuthService _authService = FirebaseAuthService();
  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_authService.authStateChanges);
    ever(firebaseUser, _handleAuthChanged);
  }

  void _handleAuthChanged(User? user) {
    Future.delayed(Duration(milliseconds: 500), () {
      if (user == null) {
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.offAllNamed(AppRoutes.home);
      }
    });
  }

  Future<void> login(String email, String password) async {
    User? user = await _authService.signInWithEmail(email, password);
    if (user != null) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.snackbar('Error', 'Login failed');
    }
  }

  Future<void> register(String email, String password) async {
    try {
      User? user = await _authService.signUpWithEmail(email, password);
      if (user != null) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.snackbar('Error', 'Registration failed');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> logout() async {
    await _authService.signOut().then(
      (value) => Get.offAllNamed(AppRoutes.login),
    );
  }
}
