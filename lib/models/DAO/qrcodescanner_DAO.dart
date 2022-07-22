import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:evsmart/networking/api_request.dart';

import '../../Authentication/google_sign_in.dart';
import '../DTO/TicketUseCodeResult.dart';

class QRScannerDAO {
  static Future<TicketUseCodeResult> useCode({
    required String ticketId,
    required String code,
  }) async {
    Response res;
    var token = await GoogleSignInProvider.getAndStoreJwtToken();
    res = await request.post(
      'tickets/' + ticketId + '/users/use-code',
      options: Options(
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer $token"
          },
          validateStatus: (status) {
            return status! < 500;
          }),
      queryParameters: {"code": code},
    );

    TicketUseCodeResult ticketUseCodeResult = new TicketUseCodeResult();
    ticketUseCodeResult.isSuccess = res.statusCode == 200;
    ticketUseCodeResult.message = res.data.toString();

    return ticketUseCodeResult;
  }
}
