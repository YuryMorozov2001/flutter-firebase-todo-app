part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}
class LogIn extends AuthEvent {}
class LogOut extends AuthEvent {}
