import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/logic/bloc/login/login_bloc.dart';
import 'package:flutter_firebase_app/router/router.dart';
import 'package:flutter_firebase_app/service/auth_service.dart';

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
