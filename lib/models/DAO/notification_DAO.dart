import 'package:evsmart/models/DTO/notification_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:dio/dio.dart';
import 'package:evsmart/networking/api_request.dart';

class NotificationDAO {
  Future<NotificationDTO> postNotification({
    String token = "",
  }) async {
    Response res;
    token = (await FirebaseMessaging.instance.getToken())!;
    res = await request.post(
      'auth/fcm-token',
      data: token,
    );
    final message = NotificationDTO.fromJson(res.data);
    return message;
  }
}
