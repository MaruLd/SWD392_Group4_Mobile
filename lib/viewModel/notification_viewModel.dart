import 'package:evsmart/models/DAO/notification_DAO.dart';
import 'package:evsmart/models/DTO/notification_model.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/utils/shared_pref.dart';
import 'package:evsmart/viewModel/base_viewModel.dart';

class NotificationViewModel extends BaseModel {
  NotificationDTO? notification;
  NotificationDAO? dao;

  NotificationViewModel() {
    dao = NotificationDAO();
  }

  Future<void> getNotification({bool isRefetch = false}) async {
    try {
      if (isRefetch) {
        setState(ViewStatus.Refreshing);
      } else if (status != ViewStatus.Loading) {
        setState(ViewStatus.Loading);
      }

      final noti = await dao?.postNotification();
      notification = noti;

      String? token = await getFCMToken();
      print(token.toString());

      setState(ViewStatus.Completed);
    } catch (e, stacktrace) {
      print(e.toString() + stacktrace.toString());
    }
  }
}
