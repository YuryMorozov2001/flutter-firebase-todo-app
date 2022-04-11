// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class SignUpEvent extends RegisterEvent {
  final String email;
  final String pass;
  SignUpEvent({
    required this.email,
    required this.pass,
  });
}
