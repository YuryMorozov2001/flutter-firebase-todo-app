import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constains/enums.dart';
import '../../../logic/bloc/register/register_bloc.dart';

class AuthRegister extends StatelessWidget {
  AuthRegister({Key? key}) : super(key: key);
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == Status.submissionFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('ой')));
        }
      },
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemBuilder: (context, index) => Center(
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              if (state.status == Status.submissionInProgress) {
                return const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                );
              }

              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthWidget(i: index),
                    const SizedBox(
                      height: 18,
                    ),
                    GestureDetector(
                      child: Text(
                        index == 0
                            ? 'у меня нет аккаунта'
                            : 'у меня есть аккаунт',
                        style: const TextStyle(
                            decoration: TextDecoration.underline),
                      ),
                      onTap: () => index == 0
                          ? _pageController.nextPage(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeInOut)
                          : _pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeInOut),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        itemCount: 2,
      ),
    );
  }
}

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    Key? key,
    required this.i,
  }) : super(key: key);
  final int i;

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          i == 0 ? 'Авторизация' : 'Регистрация',
          style: const TextStyle(fontSize: 22),
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
                  if (i == 1) {
                    context.read<RegisterBloc>().add(SignInEvent(
                        email: emailController.text,
                        pass: passController.text));
                  }
                  // Navigator.of(context).pushReplacementNamed('/home');
                },
                child: const Text('войти'))),
      ],
    );
  }
}
