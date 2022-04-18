import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/user.dart';
import '../logic/bloc/user/user_bloc.dart';
import 'auth/welcome.dart';
import 'home/home_page.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return state.user != const UserModel()
            ? const HomePage()
            : WelcomeScreen();
      },
    );
  }
}

