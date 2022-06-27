import 'package:evsmart/viewModel/event_viewModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'screens/notification/firebase_options.dart';

Future setUp() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // PushNotificationService? ps = PushNotificationService.getInstance();
  // await ps!.init();
}

void createRouteBindings() async {
  Get.put(EventViewModel());
}
