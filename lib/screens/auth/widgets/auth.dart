
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constains/enums.dart';
import '../../../logic/bloc/login/login_bloc.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    required this.pageController,
    Key? key,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Авторизация',
          style: TextStyle(fontSize: 22),
        ),
        TextField(
          decoration: const InputDecoration(hintText: 'email'),
          controller: emailController,
        ),
        TextField(
          decoration: const InputDecoration(hintText: 'password'),
          controller: passController,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              context.read<LoginBloc>().add(SignInEvent(
                  email: emailController.text, pass: passController.text));
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state.status == Status.submissionInProgress) {
                  return const SizedBox(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    width: 15,
                    height: 15,
                  );
                }
                return const Text('войти');
              },
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        GestureDetector(
          child: const Text(
            'у меня нет аккаунта',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          onTap: () => pageController.nextPage(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut),
        ),
      ],
    );
  }
}
