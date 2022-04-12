import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_app/service/auth_service.dart';

import '../../../constains/enums.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;
  LoginBloc({required this.authService}) : super(LoginState()) {
    on<SignInEvent>((event, emit) async {
      emit(state.copyWith(status: Status.submissionInProgress));
      try {
            await authService.signIn(email: event.email, pass: event.pass);
        emit(state.copyWith(status: Status.submissionSuccess));
      } on FirebaseAuthException catch (e) {
        emit(
            state.copyWith(errorMsg: e.code, status: Status.submissionFailure));
        print(e.code);
      }
    });
  }
}
