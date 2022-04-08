import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_app/service/auth_service.dart';
import 'package:meta/meta.dart';

import '../../data/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authService}) : super(AuthInitial());
  final AuthService authService;

  Future<void> signInAnon() async {
    emit(AuthLoading());
    try {
      final User user = User(uid: await authService.signInAnon(), email: '');
      emit(AuthLoaded(user: user));
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> registerWithEmailAndPass({required email, required pass}) async {
    emit(AuthLoading());
    try {
      final userData =
          await authService.registerWithEmail(email: email, pass: pass);
      final User user = User(uid: userData.uid, email: userData.email);
      emit(AuthLoaded(user: user));
    } catch (e) {
      print(e.toString());
    }
  }

  signOut() {
    emit(AuthLoading());
    try {
      authService.logOut();
      print(authService.getCurrentUser.toString());
      emit(AuthInitial());
    } catch (e) {
      print(e.toString());
    }
  }
}
