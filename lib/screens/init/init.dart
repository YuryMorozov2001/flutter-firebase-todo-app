import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/constains/enums.dart';

import '../../logic/bloc/register/register_bloc.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeScreen(),
      appBar: AppBar(title: const Text('bloc and firebase')),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      AuthWidget(pageController: _pageController),
      RegisterWidget(pageController: _pageController)
    ];
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      itemBuilder: (context, index) => Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 350,
          child: pages[index],
        ),
      ),
      itemCount: 2,
    );
  }
}

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
              // if (i == 1) {
              // context.read<RegisterBloc>().add(SignInEvent(
              //     email: emailController.text,
              //     pass: passController.text));
              // }
              // Navigator.of(context).pushReplacementNamed('/home');
            },
            child: const Text('войти'),
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
          onTap: () => pageController.nextPage(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut),
        ),
      ],
    );
  }
}

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
              context.read<RegisterBloc>().add(SignInEvent(
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
