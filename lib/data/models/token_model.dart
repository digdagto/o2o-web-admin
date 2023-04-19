
class TokenModel{
  late Token token;

  setToken(val){
    token = val;
  }

  getToken(){
    return token;
  }

  getFirebaseToken(){
    return token.firebaseToken;
  }
}

class Token {
  final String access_token;
  final int storeCd;
  final String storeId;
  final String authRoles;
  final bool storeMng;
  final int custCd;
  final String custId;
  final String firebaseToken;

  Token({
    required this.access_token,
    required this.storeCd,
    required this.storeId,
    required this.custCd,
    required this.custId,
    required this.authRoles,
    required this.storeMng,
    required this.firebaseToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      access_token: json['access_token'],
      storeCd: json['storeCd'],
      storeId: json['storeId'],
      custCd: json['custCd'],
      custId: json['custId'],
      authRoles: json['authRoles'],
      storeMng: json['storeMng'],
      firebaseToken: json['firebaseToken'],
    );
  }


}
