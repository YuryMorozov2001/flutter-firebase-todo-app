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
  HomeBody({
    Key? key,
  }) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: textEditingController,
        ),
        ElevatedButton(
            onPressed: () {
              context.read<TodoBloc>().add(AddTodoEvent(
                  task: textEditingController.text,
                  isComplete: false,
                  uid: context.read<UserBloc>().state.user?.uid));
              textEditingController.clear();
            },
            child: const Text('create true')),
        Expanded(
          child: Column(
            children: const [
              Expanded(child: ListViewOwnWidget()),
              Divider( 
                thickness: 2, 
                color: Colors.orange,
              ),
              Expanded(child: ListViewPublicWidget()),
            ],
          ),
        ),
      ],
    );
  }
}
