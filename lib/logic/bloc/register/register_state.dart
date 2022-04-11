// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

class RegisterState {
  final Status status;
  RegisterState({
    this.status = Status.empty,
  });

  RegisterState copyWith({
    Status? status,
  }) {
    return RegisterState(
      status: status ?? this.status,
    );
  }
}
