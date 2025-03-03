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

  factory TaskModel.fromMap(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
    String id,
  ) {
    final data = snapshot.data();
    return TaskModel(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      date: data['date'] ?? Timestamp.now(),
      isCompleted: data['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "date": date,
      "isCompleted": isCompleted,
    };
  }
}
