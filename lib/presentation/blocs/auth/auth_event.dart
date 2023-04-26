import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class Login extends AuthenticationEvent {
  final String id;
  final String pass;

  Login({required this.id, required this.pass});

  @override
  List<Object> get props => [id, pass];
}
