import 'package:evsmart/models/DAO/eventDetail_DAO.dart';
import 'package:evsmart/models/DAO/event_DAO.dart';
import 'package:evsmart/models/DTO/eventDetail_model.dart';
import 'package:evsmart/models/DTO/event_model.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/viewModel/base_viewModel.dart';

import '../models/DAO/event_DAO.dart';

class EventDetailViewModel extends BaseModel {
  EventDetailDAO? eventDetailDAO;
  EventDetail? eventDetail;
  EventDetailViewModel() {
    eventDetailDAO = EventDetailDAO();
  }

  Future<void> getEventDetail(String eventId) async {
    try {
      setState(ViewStatus.Loading);
      eventDetail = await eventDetailDAO?.getEventDetail(eventId: eventId);
      await Future.delayed(Duration(microseconds: 500));
      setState(ViewStatus.Completed);
    } catch (e) {
      eventDetail = null;
      setState(ViewStatus.Completed);
    }
  }
}
