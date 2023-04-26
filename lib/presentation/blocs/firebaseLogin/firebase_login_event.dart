import 'package:equatable/equatable.dart';
abstract class FirebaseLoginEvent {
  const FirebaseLoginEvent();
}

class FirebaseLoginWithToken extends FirebaseLoginEvent {
  final String token;

  const FirebaseLoginWithToken(this.token);
}