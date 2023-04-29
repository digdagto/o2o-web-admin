import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:o2o_point_configuration/data/models/token_model.dart';
import 'package:o2o_point_configuration/domain/services/auth_service.dart';
import 'package:o2o_point_configuration/presentation/blocs/firebaseLogin/firebase_login_bloc.dart';
import 'package:o2o_point_configuration/presentation/blocs/firebaseLogin/firebase_login_event.dart';
import 'package:o2o_point_configuration/presentation/controllers/configuration_controller.dart';
import 'package:o2o_point_configuration/presentation/controllers/token_controller.dart';
import 'package:o2o_point_configuration/utils/api.dart';

class AuthServiceImpl implements AuthService {
  late TokenController _tokenController;
  late FirebaseLoginBloc _firebaseLoginBloc; // Add this line

//constructor
  AuthServiceImpl({required FirebaseLoginBloc firebaseLoginBloc}) {
    _tokenController = TokenController();
    _firebaseLoginBloc = firebaseLoginBloc; // Add this line
  }

  @override
  Future<void> login(String id, String pass) async {
    final authToken = base64.encode(utf8.encode('$id:$pass'));

    try {
      //Send authentication request
      final response = await ApiClient.postWithHeader(
        ApiClient.baseUrl + ApiClient.loginApi,
        {'username': id, 'password': pass},
        headers: {'Authorization': 'Basic $authToken'},
      );

      final token = Token.fromJson(response);

      _tokenController.setToken(token);

      print(token.firebaseToken);
      print(token.firebaseToken.length);
      await firebaseLogin(token.firebaseToken);
    } catch (error) {
      print('firebase login Error: $error');
    }
  }

  @override
  Future<void> firebaseLogin(token) async {
    print(FirebaseAuth.instance);
    FirebaseAuth.instance.signInWithCustomToken(token!).then((fbResult) {
      // Emit the FirebaseLoginWithToken event
      _firebaseLoginBloc.add(FirebaseLoginWithToken(token));
    });
  }

  @override
  Future<void> callApi(String path) async{
    final authToken = base64.encode(utf8.encode('app:1234'));

    try {
      // Send authentication request
      final response = await ApiClient.postWithHeader(
        "http://localhost:8080" + path,
        {'username': 'app', 'password': '1234'},
        headers: {'Authorization': 'Basic $authToken'},
      );

      print("response");
      print(response);

      // final token = Token.fromJson(response);

      // _tokenController.setToken(token);

    } catch (error) {
      print('Error: $error');
    }
  }
}