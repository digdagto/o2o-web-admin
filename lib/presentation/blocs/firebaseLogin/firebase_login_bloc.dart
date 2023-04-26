import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:o2o_point_configuration/presentation/blocs/firebaseLogin/firebase_login_event.dart';
import 'package:o2o_point_configuration/presentation/blocs/firebaseLogin/firebase_login_state.dart';



class FirebaseLoginBloc extends Bloc<FirebaseLoginEvent, FirebaseLoginState> {
  FirebaseLoginBloc() : super(FirebaseLoginInitial()){
    on<FirebaseLoginWithToken>(_onFirebaseLoginWithToken);
  }

  Future<void> _onFirebaseLoginWithToken(
      FirebaseLoginWithToken event, Emitter<void> emit) async {
    try {
      print("1111");
      // Your logic for handling the FirebaseLoginWithToken event
    } catch (e) {
      // Handle exceptions
    }
  }

  @override
  Stream<FirebaseLoginState> mapEventToState(FirebaseLoginEvent event) async* {
    if (event is FirebaseLoginWithToken) {
      yield FirebaseLoginLoading();
      try {
        await firebaseLogin(event.token);
        emit(FirebaseLoginSuccess());
      } catch (error) {
        emit(FirebaseLoginFailure(error: error.toString()));
      }
    }
  }

  Future<void> firebaseLogin(String token) async {
    await FirebaseAuth.instance.signInWithCustomToken(token);
  }
}
