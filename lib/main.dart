import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/bloc/todo/todo_bloc.dart';
import 'service/firestore_service.dart';
import 'logic/bloc/login/login_bloc.dart';
import 'logic/bloc/user/user_bloc.dart';
import 'router/router.dart';
import 'service/auth_service.dart';

import 'logic/bloc/register/register_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();
  final AuthService authService = AuthService();
  final FireStoreService fireStoreService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
          create: (BuildContext context) =>
              RegisterBloc(authService: authService),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(authService: authService),
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(authService: authService),
        ),
        BlocProvider<TodoBloc>(
          create: (BuildContext context) => TodoBloc(
              fireStoreService: fireStoreService)
            ..add(ReadTodoEvent(todoStream: fireStoreService.getTodoStream())),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Firebase Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
