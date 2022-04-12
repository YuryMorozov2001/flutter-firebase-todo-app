// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

class RegisterState {
  final Status status;
  final String? errorMsg;
  RegisterState({
    this.status = Status.empty,
    this.errorMsg,
  });

  RegisterState copyWith({
    Status? status,
    String? errorMsg,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
