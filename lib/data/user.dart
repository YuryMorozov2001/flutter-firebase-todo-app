import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? uid;
  final String? email;
  const UserModel({
     this.uid,
     this.email,
  });

  @override 
  List<Object?> get props => [uid, email];
}
