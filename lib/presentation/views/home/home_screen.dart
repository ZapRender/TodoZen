import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_zen/core/theme/app_text_theme.dart';
import 'package:todo_zen/presentation/controllers/home_controller.dart';
import 'package:todo_zen/presentation/controllers/task_controller.dart';
import 'package:todo_zen/presentation/views/home/widgets/bottom_sheet_tasks.dart';
import 'package:todo_zen/presentation/views/home/widgets/no_tasks.dart';
import 'package:todo_zen/presentation/views/home/widgets/task_item_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final TaskController taskController = Get.put(TaskController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TodoZen',
          style: AppTextTheme.darkTextTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (taskController.tasks.isEmpty) {
          return NoTasks();
        } else {
          return ListView.builder(
            itemCount: taskController.tasks.length,
            itemBuilder: (context, index) {
              final task = taskController.tasks[index];
              return TasksItemList(
                taskValue: task,
              );
            },
          );
        }
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(child: BottomSheetTasks()),
              );
            },
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.logout_outlined, color: Colors.white),
              label: 'Logout',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history, color: Colors.white),
              label: 'History',
            ),
          ],
          currentIndex: homeController.selectedIndex.value,
          onTap: homeController.onItemTapped,
        ),
      ),
    );
  }
}
