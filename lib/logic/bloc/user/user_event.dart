// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetUserEvent extends UserEvent {
  final User? user;
  GetUserEvent({
    this.user,
  });
}

class SignOutEvent extends UserEvent {}
