import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_app/constains/enums.dart';
import 'package:flutter_firebase_app/service/auth_service.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthService authService;
  RegisterBloc({required this.authService}) : super(RegisterState()) {
    on<SignInEvent>((event, emit) async {
      emit(state.copyWith(status: Status.submissionInProgress));
      try {
        await authService.registerWithEmail(
            email: event.email, pass: event.pass);
        emit(state.copyWith(status: Status.submissionSuccess));
      } catch (e) {
        emit(state.copyWith(status: Status.submissionFailure));
        print(e.toString());
      }
    });
  }
}