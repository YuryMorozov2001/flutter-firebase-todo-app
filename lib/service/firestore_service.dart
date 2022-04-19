import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/todo.dart';

class FireStoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference todo = FirebaseFirestore.instance.collection('todo');
  Future<void> addTodo({isComplete, task, uid, creator}) async {
    await todo.doc('$uid').set(
      {
        'todos': FieldValue.arrayUnion(
            [Todo(isComplete: isComplete, task: task, creator: creator).toMap()])
      },
      SetOptions(merge: true),
    );
  }

  Future<void> updateTodo({newArr, uid}) async {
    await todo.doc('$uid').set(
      {'todos': newArr},
    );
  }

  Future<void> removeTodo({isComplete, task, uid, creator}) async {
    await todo.doc('$uid').update(
      {
        'todos': FieldValue.arrayRemove(
            [Todo(isComplete: isComplete, task: task, creator: creator).toMap()])
      },
    );
  }

  Stream<QuerySnapshot> getTodoStream() {
    return todo.snapshots();
  }
}
