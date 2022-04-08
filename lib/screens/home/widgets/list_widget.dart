import 'package:flutter/material.dart';

import '../../../data/todo.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final List<Todo> todo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) =>
          ListItem(isComplete: todo[i].isComplete, task: todo[i].task),
      itemCount: todo.length,
      shrinkWrap: true,
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
