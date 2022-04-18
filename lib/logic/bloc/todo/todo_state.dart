// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final Status status;
  final String? errorMsg;
  final Stream<QuerySnapshot>? todosStream;
  const TodoState({
    this.status = Status.empty,
    this.errorMsg,
    this.todosStream,
  });

  @override
  List<Object> get props => [];

  TodoState copyWith({
    Status? status,
    String? errorMsg,
    Stream<QuerySnapshot>? todosStream,
  }) {
    return TodoState(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
      todosStream: todosStream ?? this.todosStream,
    );
  }
}
