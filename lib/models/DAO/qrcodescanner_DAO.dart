import 'package:dio/dio.dart';
import 'package:evsmart/networking/api_request.dart';

import '../../Authentication/google_sign_in.dart';

class QRScannerDAO {
  static Future<String> useCode({
    required String ticketId,
    required String code,
  }) async {
    Response res;
    var token = await GoogleSignInProvider.getAndStoreJwtToken();
    res = await request.post(
      'tickets/' + ticketId + 'user/use-code',
      options: Options(
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        },
      ),
      queryParameters: {"code": code},
    );
    return res.statusCode.toString();
  }
}
