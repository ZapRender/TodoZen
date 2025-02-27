import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String id;
  String title;
  String description;
  Timestamp date;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.isCompleted = false,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map, String id) {
    return TaskModel(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? Timestamp.now(),
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'isCompleted': isCompleted,
    };
  }
}
