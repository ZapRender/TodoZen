import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_zen/data/models/task_model.dart';

class FirestoreService {
  final CollectionReference _taskCollection = FirebaseFirestore.instance
      .collection('tasks');

  Future<void> addTask(TaskModel task) async {
    DocumentReference docRef = await _taskCollection.add(task.toMap());
    await docRef.update({'id': docRef.id});
  }

  Future<void> updateTask(TaskModel task) async {
    await _taskCollection.doc(task.id).update(task.toMap());
  }

  Future<void> deleteTask(String id) async {
    await _taskCollection.doc(id).delete();
  }

  Stream<List<TaskModel>> getTask() {
    return _taskCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => TaskModel.fromMap(doc as QueryDocumentSnapshot<Map<String, dynamic>>, doc.id))
        .toList());
    
  }
}
