import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/logic/bloc/auth_bloc.dart';
import 'package:flutter_firebase_app/logic/cubit/auth_cubit.dart';
import 'package:flutter_firebase_app/router/router.dart';
import 'package:flutter_firebase_app/service/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
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
