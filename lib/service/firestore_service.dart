import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_app/data/todo.dart';

class FireStoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference todo = FirebaseFirestore.instance.collection('todo');
  Future<void> addTodo({isComplete, task, uid}) async {
    await todo.doc('$uid').set(
      {
        'todos': FieldValue.arrayUnion(
            [Todo(isComplete: isComplete, task: task).toMap()])
      },
      SetOptions(merge: true),
    );
  }

  Future<void> removeTodo({isComplete, task, uid}) async {
    await todo.doc('$uid').update(
      {
        'todos': FieldValue.arrayRemove(
            [Todo(isComplete: isComplete, task: task).toMap()])
      },
    );
  }

  Stream<QuerySnapshot> getTodoStream() {
    return todo.snapshots();
  }
}
