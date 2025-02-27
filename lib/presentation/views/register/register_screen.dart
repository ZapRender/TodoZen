import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_zen/presentation/controllers/auth_controller.dart';
import 'package:todo_zen/routes/app_routes.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Register',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: 53.0),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                    ),
                    SizedBox(height: 30.0),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter your password',
                      ),
                    ),
                    SizedBox(height: 30.0),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                        hintText: 'Enter your password',
                      ),
                    ),
                    SizedBox(height: 69.0),
                    ElevatedButton(
                      onPressed: () {
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          authController.register(
                            emailController.text,
                            passwordController.text,
                          );
                        } else {
                          Get.snackbar('Error', 'Passwords do not match');
                        }
                      },
                      child: const Text('Register'),
                    ),
                    SizedBox(height: 31.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Divider(color: Colors.grey, thickness: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("or"),
                        ),
                        Expanded(
                          child: Divider(color: Colors.grey, thickness: 1),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        TextButton(
                          onPressed: () async {
                            Get.toNamed(AppRoutes.login);
                          },
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
