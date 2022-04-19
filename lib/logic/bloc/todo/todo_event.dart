// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

abstract class TodoEvent {
  const TodoEvent();
}

class ReadTodoEvent extends TodoEvent {
  final Stream<QuerySnapshot>? todoStream;
  ReadTodoEvent({
    this.todoStream,
  }) {
    print('lets start');
  }
}

class DeleteTodoEvent extends TodoEvent {
  final String task;
  final bool isComplete;
  final String? uid;
  final String? creator;
  DeleteTodoEvent({
    required this.task,
    required this.isComplete,
    required this.uid,
    required this.creator
  });
}

class CreateTodoEvent extends TodoEvent {
  final String task;
  final bool isComplete;
  final String? uid;
  final String? creator;
  CreateTodoEvent({
    required this.task,
    required this.isComplete,
    required this.uid,
    required this.creator,
  });
}

class UpdateTodoEvent extends TodoEvent {
  final List newArr;
  final String? uid; 
  UpdateTodoEvent({
    required this.newArr,
    required this.uid, 
  });
}
