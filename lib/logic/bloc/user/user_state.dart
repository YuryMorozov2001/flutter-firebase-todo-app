// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

class UserState {
  final Status status;
  final UserModel? user;
  UserState({
    this.status = Status.empty,
    this.user,
  });

  UserState copyWith({
    Status? status,
    UserModel? user,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
