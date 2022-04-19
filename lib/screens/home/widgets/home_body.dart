import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/bloc/todo/todo_bloc.dart';
import '../../../logic/bloc/user/user_bloc.dart';
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
        const SizedBox(height: 16),
        SizedBox(
          child: TextField(
            controller: textEditingController,
            decoration:   InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: 'ur task',
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.9,
        ),
        ElevatedButton(
            onPressed: () {
              context.read<TodoBloc>().add(
                    CreateTodoEvent(
                        task: textEditingController.text,
                        isComplete: false,
                        uid: context.read<UserBloc>().state.user?.uid,
                        creator: context.read<UserBloc>().state.user?.email),
                  );
              textEditingController.clear();
            },
            child: const Text('create todo')),
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
