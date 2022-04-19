// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  bool isComplete;
  String task;
  String creator;
  Todo({
    required this.isComplete,
    required this.task,
    required this.creator,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isComplete': isComplete,
      'task': task,
      'creator': creator,
    };
  }
}

class TodoModel {
  // List<Task> tasks;
}
