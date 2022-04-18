import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constains/enums.dart';
import '../../logic/bloc/login/login_bloc.dart';
import 'widgets/auth.dart';
import 'widgets/register.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      AuthWidget(pageController: _pageController),
      RegisterWidget(pageController: _pageController)
    ];
    return Scaffold(
      appBar:  AppBar(title: const Text('BLoC + firebase')),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == Status.submissionFailure) {
            switch (state.errorMsg) {
              case 'unknown':
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('вы не ввели данные')));
                break;
              case 'user-not-found':
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('пользователь не найден')));
                break;
              case 'wrong-password':
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('не правильный пароль')));
                break;
              default:
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('что то пошло не так')));
            }
          }
        },
        child: PageView.builder(
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
        ),
      ),
    );
  }
}
