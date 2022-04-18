
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constains/enums.dart';
import '../../../logic/bloc/register/register_bloc.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({
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
          'Регистрация',
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
              context.read<RegisterBloc>().add(SignUpEvent(
                  email: emailController.text, pass: passController.text));
            },
            child: BlocBuilder<RegisterBloc, RegisterState>(
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
            'у меня есть аккаунт',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          onTap: () => pageController.animateToPage(0,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut),
        ),
      ],
    );
  }
}
