import 'package:flutter/material.dart';
import 'package:todo_zen/core/theme/app_colors.dart';
import 'package:todo_zen/core/theme/app_text_theme.dart';

class BottomSheetTasks extends StatelessWidget {
  const BottomSheetTasks({super.key});

  @override
  Widget build(BuildContext context) {
    // DateTime firstDate = DateTime.now();
    // DateTime lastDate = DateTime.now().add(Duration(days: 7));
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add Task', style: AppTextTheme.darkTextTheme.headlineMedium),
          TextField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 18.0,
                color: AppColors.primaryTextDark.withValues(alpha: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: 'Tittle',
            ),
          ),
          TextField(
            textCapitalization: TextCapitalization.sentences,
            maxLines: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 18.0,
                color: AppColors.primaryTextDark.withValues(alpha: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: 'Description',
            ),
          ),

          TextField(
            textCapitalization: TextCapitalization.sentences,
            maxLines: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 18.0,
                color: AppColors.primaryTextDark.withValues(alpha: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: 'Date',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: null,
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.buttonColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
