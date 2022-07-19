import 'package:evsmart/viewModel/account_viewModel.dart';
import 'package:evsmart/viewModel/eventAgenda_viewModel.dart';
import 'package:evsmart/viewModel/eventDetail_viewModel.dart';
import 'package:evsmart/viewModel/event_viewModel.dart';
import 'package:evsmart/viewModel/ticket_viewModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'screens/notification/firebase_options.dart';
import 'viewModel/notification_viewModel.dart';
import 'viewModel/ticketUser_viewModel.dart';

Future setUp() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // PushNotificationService? ps = PushNotificationService.getInstance();
  // await ps!.init();
}

void createRouteBindings() async {
  Get.put(EventViewModel());
  Get.put(TicketUserViewModel());
  Get.put(TicketViewModel());
  Get.put(EventAgendaViewModel());
  Get.put(EventDetailViewModel());
  Get.put(AccountViewModel());
  Get.put(NotificationViewModel());
}
