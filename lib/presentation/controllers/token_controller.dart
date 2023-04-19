
import 'package:get/get.dart';
import 'package:o2o_point_configuration/data/models/token_model.dart';

class TokenController extends GetxController
{
  Token? _token;
  RxInt value = 0.obs;

  void setToken(Token token) {
    _token = token;
    update();
  }

  //interface


  Token? get token => _token;

}