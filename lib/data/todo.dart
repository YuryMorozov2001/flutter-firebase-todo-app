import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo { 
  bool isComplete;
  String task;
  Todo({ 
    required this.isComplete,
    required this.task,
  });

  Map<String, dynamic> toMap() {
    return { 
      'isComplete': isComplete,
      'task': task,
    };
  }
 
}

class TodoModel { 
  // List<Task> tasks;
}
