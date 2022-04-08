
import 'package:flutter/material.dart';

import '../../../data/todo.dart';
import 'list_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Todo> todo = [
      Todo(isComplete: true, task: 'помыть попу'),
      Todo(isComplete: true, task: 'помыть жопу'),
      Todo(isComplete: false, task: 'помыть пол'),
    ];
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Привет, %USER_NAME%'),
          ListViewWidget(todo: todo),
        ],
      ),
    );
  }
}

