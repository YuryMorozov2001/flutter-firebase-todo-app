import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/logic/bloc/todo/todo_bloc.dart';
import 'package:flutter_firebase_app/service/firestore_service.dart';

import '../../../data/todo.dart';
import '../../../logic/bloc/user/user_bloc.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return StreamBuilder<QuerySnapshot>(
            stream: state.todosStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data?.size == 0) {
                return const Center(child: Text('данных нет'));
              } else if (snapshot.hasData) {
                dynamic userTodo;
                snapshot.data?.docs.forEach((element) {
                  if (element.id == context.read<UserBloc>().state.user?.uid) {
                    userTodo = element.get('todos');
                  }
                });
                if (userTodo.isEmpty) {
                  return const Center(child: Text('у вас нет данных'));
                }
                if (userTodo != null) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) => GestureDetector(
                      onTap: () {
                        context.read<TodoBloc>().add(RemoveTodoEvent(
                              task: userTodo[i]['task'],
                              isComplete: userTodo[i]['isComplete'],
                              uid: context.read<UserBloc>().state.user?.uid,
                            ));
                      },
                      child: ListItem(
                        isComplete: userTodo[i]['isComplete'],
                        task: userTodo[i]['task'],
                      ),
                    ),
                    itemCount: userTodo.length,
                    shrinkWrap: true,
                  );
                }
              }
              return const CircularProgressIndicator();
            });
      },
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.isComplete,
    required this.task,
  }) : super(key: key);
  final bool isComplete;
  final String task;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isComplete ? Colors.green : Colors.red,
      child: SizedBox(
        child: Text(task.toString()),
        height: 100,
      ),
    );
  }
}
