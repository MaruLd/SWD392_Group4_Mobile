import 'package:evsmart/Authentication/google_sign_in.dart';
import 'package:evsmart/models/DTO/notification_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:dio/dio.dart';
import 'package:evsmart/networking/api_request.dart';

class NotificationDAO {
  Future<NotificationDTO> postNotification({
    String fcm_token = "",
  }) async {
    Response res;
    var token = await GoogleSignInProvider.getAndStoreJwtToken();
    fcm_token = (await FirebaseMessaging.instance.getToken())!;
    res = await request.post(
      'auth/fcm-token',
      options: Options(headers: {"authorization": "Bearer $token"}),
      data: fcm_token,
    );
    final message = NotificationDTO.fromJson(res.data);
    return message;
  }
}
