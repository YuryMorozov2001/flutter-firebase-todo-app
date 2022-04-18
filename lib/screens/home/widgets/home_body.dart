import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/logic/bloc/todo/todo_bloc.dart';
import 'package:flutter_firebase_app/logic/bloc/user/user_bloc.dart';
import 'package:flutter_firebase_app/service/firestore_service.dart';
import 'package:bloc/bloc.dart';
import '../../../data/todo.dart';
import 'list_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<TodoBloc>().add(AddTodoEvent(
                        task: 'task',
                        isComplete: true,
                        uid: context.read<UserBloc>().state.user?.uid));
                  },
                  child: const Text('create true')),
              const SizedBox(width: 15),
              ElevatedButton(
                  onPressed: () {
                    context.read<TodoBloc>().add(AddTodoEvent(
                        task: 'task',
                        isComplete: false,
                        uid: context.read<UserBloc>().state.user?.uid));
                  },
                  child: const Text('create false')),
            ],
          ),
          const Text('Привет, %USER_NAME%'),
          const ListViewWidget(),
        ],
      ),
    );
  }
}
