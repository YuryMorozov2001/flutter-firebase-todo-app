import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LogIn>((event, emit) {
      print('event log in');
    });
    on<LogOut>((event, emit) {
      print('event log out ');
    });
  }
}
