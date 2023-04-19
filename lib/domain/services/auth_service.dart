

abstract class AuthService {
  Future<void> login(String id, String token);
  Future<void> firebaseLogin(String? token);
}

