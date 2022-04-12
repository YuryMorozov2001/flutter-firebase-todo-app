import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_app/data/user.dart';
import 'package:flutter_firebase_app/service/auth_service.dart';
import 'package:meta/meta.dart';

import '../../../constains/enums.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthService authService;
  late StreamSubscription _streamSubscription;
  UserBloc({required this.authService}) : super(UserState()) {
    _streamSubscription = authService.userStream().listen((event) {
      add(GetUserEvent(user: event));
    });
    on<GetUserEvent>((event, emit) {
      UserModel user =
          UserModel(uid: event.user?.uid, email: event.user?.email);
      emit(state.copyWith(user: user));
    });
    on<SignOutEvent>((event, emit) async {
      emit(state.copyWith(status: Status.submissionInProgress));
      await authService.signOut();
      emit(state.copyWith(
          status: Status.submissionSuccess,
          user: UserModel(uid: null, email: null)));
    });
  }
  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
