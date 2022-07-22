import 'package:evsmart/Authentication/google_sign_in.dart';
import 'package:evsmart/models/DTO/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:evsmart/networking/api_request.dart';

class AuthDAO {
  Future<AuthDTO> getJwtToken({
    String token = "",
  }) async {
    Response res;
    token = (await GoogleSignInProvider.getUserToken())!;
    res = await request.post(
      'auth/auth-google',
      queryParameters: {"token": token},
    );
    final auth = AuthDTO.fromJson(res.data);
    return auth;
  }

  Future<AuthDTO> getUser() async {
    Response res;
    var token = await GoogleSignInProvider.getAndStoreJwtToken();
    res = await request.get("user/me",
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ));
    final user = AuthDTO.fromJson(res.data);
    return user;
  }
}
