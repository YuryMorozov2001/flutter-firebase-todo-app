part of 'login_bloc.dart';
 
abstract class LoginEvent {}

class SignInEvent extends LoginEvent {
  final String email;
  final String pass;
  SignInEvent({
    required this.email,
    required this.pass,
  });
}
