


abstract class FirebaseLoginState {}

class FirebaseLoginInitial extends FirebaseLoginState {}

class FirebaseLoginLoading extends FirebaseLoginState {}

class FirebaseLoginSuccess extends FirebaseLoginState {}

class FirebaseLoginFailure extends FirebaseLoginState {
  final String error;

  FirebaseLoginFailure({required this.error});
}