import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_app/service/firestore_service.dart';

import '../../../constains/enums.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  FireStoreService fireStoreService;

  TodoBloc({required this.fireStoreService}) : super(const TodoState()) {
    on<GetTodoEvent>((event, emit) {
      emit(state.copyWith(
          status: Status.submissionSuccess, todosStream: event.todoStream));
    });
    on<RemoveTodoEvent>((event, emit) async {
      await fireStoreService.removeTodo(
          isComplete: event.isComplete, task: event.task, uid: event.uid);
    });
    on<AddTodoEvent>((event, emit) async {
      await fireStoreService.addTodo(
          isComplete: event.isComplete, task: event.task, uid: event.uid);
    });
    on<UpdateTodoEvent>((event, emit) async {
      await fireStoreService.updateTodo(newArr: event.newArr, uid: event.uid);
    });
  }
}
