import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/data/todo.dart';

import 'widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Домашнаяя страница'),
        actions: [
          IconButton(
              onPressed: () => print('logout'), icon: const Icon(Icons.logout))
        ],
      ),
      body: const HomeBody(),
    );
  }
}

