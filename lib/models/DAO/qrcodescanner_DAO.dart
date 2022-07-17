import 'package:dio/dio.dart';
import 'package:evsmart/networking/api_request.dart';

class QRScannerDAO {
  static Future<void> useCode({
    required String ticketId,
    required String code,
  }) async {
    Response res;
    res = await request.post(
      'tickets/' + ticketId + '/use-code',
      queryParameters: {"code": code},
    );
  }
}
