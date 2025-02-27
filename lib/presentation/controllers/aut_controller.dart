import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_zen/core/services/firebase_auth_service.dart';

class AuthController extends GetxController {
  final FirebaseAuthService _authService = FirebaseAuthService();
  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    firebaseUser.bindStream(_authService.authStateChanges);
    super.onInit();
  }

  Future<void> login(String email, String password) async {
    User? user = await _authService.signInWithEmail(email, password);
    if (user != null) {
      Get.back();
    } else {
      Get.snackbar('Error', 'Login failed');
    }
  }

  Future<void> logout() async {
    await _authService.signOut();
    Get.offAllNamed('/login');
  }
}
