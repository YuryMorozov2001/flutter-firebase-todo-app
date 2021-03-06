import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/bloc/todo/todo_bloc.dart';
import '../../../logic/bloc/user/user_bloc.dart';

class ListViewOwnWidget extends StatelessWidget {
  const ListViewOwnWidget({
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
                if (userTodo == null) {
                  return const Center(child: Text('у вас нет данных'));
                }
                if (userTodo.isEmpty) {
                  return const Center(child: Text('у вас нет данных'));
                }
                if (userTodo != null) {
                  return ListView.builder(
                    itemBuilder: (context, i) => GestureDetector(
                      onLongPress: () {
                        context.read<TodoBloc>().add(DeleteTodoEvent(
                              task: userTodo[i]['task'],
                              isComplete: userTodo[i]['isComplete'],
                              uid: context.read<UserBloc>().state.user?.uid,
                              creator:
                                  context.read<UserBloc>().state.user?.email,
                            ));
                      },
                      child: ListItem(
                        userTodo: userTodo,
                        i: i,
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

class ListViewPublicWidget extends StatelessWidget {
  const ListViewPublicWidget({
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
                List todo = [];
                snapshot.data?.docs.forEach((element) {
                  element.get('todos').forEach((e) => todo.add(e));
                });
                return ListView.builder(
                  itemBuilder: (context, i) => ListItem(
                    i: i,
                    isComplete: todo[i]['isComplete'],
                    task: todo[i]['task'],
                    creator: todo[i]['creator'],
                  ),
                  itemCount: todo.length,
                  shrinkWrap: true,
                );
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
    this.userTodo,
    this.creator = '',
    required this.i,
    required this.isComplete,
    required this.task,
  }) : super(key: key);
  final dynamic userTodo;
  final String creator;
  final int i;
  final bool isComplete;
  final String task;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.scale(
            scale: 1.5,
            child: Checkbox(
              value: isComplete,
              onChanged: (_) {
                if (userTodo != null) {
                  userTodo[i]['isComplete'] = !userTodo[i]['isComplete'];
                  context.read<TodoBloc>().add(UpdateTodoEvent(
                        newArr: userTodo,
                        uid: context.read<UserBloc>().state.user?.uid,
                      ));
                }
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task,
                  style: const TextStyle(fontSize: 16),
                ),
                creator == ''
                    ? const SizedBox()
                    : Text(
                        creator,
                        style: const TextStyle(fontSize: 16),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
