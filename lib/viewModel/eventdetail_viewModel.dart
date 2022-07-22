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

  Future<EventDetail?> getEventDetail(String eventId) async {
    try {
      return await eventDetailDAO?.getEventDetail(eventId: eventId);
    } catch (e) {
      eventDetail = null;
    }
  }
}
