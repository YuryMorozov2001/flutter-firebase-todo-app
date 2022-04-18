import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/service/firestore_service.dart';
import '../../logic/bloc/user/user_bloc.dart';

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
              onPressed: () {
                context.read<UserBloc>().add(SignOutEvent());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body:   HomeBody(),
    );
  }
}
