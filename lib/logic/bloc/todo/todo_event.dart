// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

abstract class TodoEvent {
  const TodoEvent();
}

class GetTodoEvent extends TodoEvent {
  final Stream<QuerySnapshot>? todoStream;
  GetTodoEvent({
    this.todoStream,
  }) {
    print('lets start');
  }
}

class RemoveTodoEvent extends TodoEvent {
  final String task;
  final bool isComplete;
  final String? uid;
  RemoveTodoEvent({
    required this.task,
    required this.isComplete,
    required this.uid,
  });
}
class AddTodoEvent extends TodoEvent {
  final String task;
  final bool isComplete;
  final String? uid;
  AddTodoEvent({
    required this.task,
    required this.isComplete,
    required this.uid,
  });
}
