import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o2o_point_configuration/domain/services/auth_service.dart';
import 'package:o2o_point_configuration/presentation/blocs/auth/auth_state.dart';

import 'auth_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService authService;

  AuthenticationBloc({required this.authService})
      : super(AuthenticationInitial()) {
    on<Login>((event, emit) async {
      try {
        await authService.login(event.id, event.pass);
        emit(LoggedIn());
      } catch (e) {
        // Handle login error here
      }
    });
  }

  Stream<AuthenticationState> _mapLoginToState(Login event) async* {
    try {
      await authService.login(event.id, event.pass);
      yield LoggedIn();
    } catch (error) {
      // Handle error
      print('Login Error: $error');
    }
  }
}