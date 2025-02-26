import 'package:flutter/material.dart';
import 'package:todo_zen/core/theme/app_colors.dart';
import 'package:todo_zen/core/theme/app_text_theme.dart';

class TaskDescriptionScreen extends StatelessWidget {
  const TaskDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        leading: IconButton(
          onPressed: null,
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline, color: AppColors.error),
            onPressed: () {
              // Acción para el icono de editar
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.darkBackground,
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: null,
            child: Text(
              'Mark as done',
              style: TextStyle(color: AppColors.primaryDark, fontSize: 16),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 27.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task title',
                    style: AppTextTheme.darkTextTheme.headlineMedium,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 5),
                          Text('Task Date: '),
                        ],
                      ),
                      Card(
                        color: AppColors.darkCard,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                          child: Text('Today'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Description',
                    style: TextStyle(color: AppColors.secondaryTextDark),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
