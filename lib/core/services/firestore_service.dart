import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_zen/data/models/task_model.dart';

class FirestoreService {
  final FirebaseFirestore _taskCollection = FirebaseFirestore.instance;

  Future<void> addTask(TaskModel task) async {
    DocumentReference docRef = await _taskCollection.collection('tasks').add(task.toMap());
    await docRef.update({'id': docRef.id});
  }

  Future<void> updateTask(TaskModel task) async {
    await _taskCollection.collection('tasks').doc(task.id).update(task.toMap());
  }

  Future<void> deleteTask(String id) async {
    await _taskCollection.collection('tasks').doc(id).delete();
  }

  Stream<List<TaskModel>> getTasks() {
    return _taskCollection.collection('tasks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return TaskModel.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }
}
