import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:todo_zen/presentation/controllers/onboarding_controller.dart';
import 'package:todo_zen/routes/app_routes.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final OnboardingController controller = Get.put(OnboardingController());

  final List<Widget> screen = [
    _Screen(
      color: Colors.blue.shade100,
      icon: Icons.phone_android,
      tittle: 'Manage your tasks',
      description: 'you can easily manage your tasks',
    ),
    _Screen(
      color: Colors.green.shade100,
      icon: Icons.shopping_cart,
      tittle: 'Create daily routine',
      description: 'In TodoZen you can create your personalized routine to stay productive',
    ),
    _Screen(
      color: Colors.purple.shade100,
      icon: Icons.star,
      tittle: '¡Comienza Ahora!',
      description: 'Únete a la comunidad',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  controller.onPageChanged(index);
                },
              ),
              items: screen,
            ),
          ),
          SizedBox(height: 20),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(screen.length, (index) {
                return Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.currentIndex.value == index
                        ? Colors.blue
                        : Colors.grey,
                  ),
                );
              }),
            );
          }),
          SizedBox(height: 20),
          Obx(() {
            return ElevatedButton(
              onPressed: () {
                if (controller.currentIndex.value < screen.length - 1) {
                  controller.onPageChanged(controller.currentIndex.value + 1);
                } else {
                  Get.put(AppRoutes.login);
                }
              },
              child: Text(controller.currentIndex.value == screen.length - 1
                  ? 'SKIP'
                  : 'NEXT'),
            );
          }),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _Screen extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String tittle;
  final String description;

  const _Screen({
    required this.color,
    required this.icon,
    required this.tittle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 100),
            SizedBox(height: 20),
            Text(
              tittle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}
