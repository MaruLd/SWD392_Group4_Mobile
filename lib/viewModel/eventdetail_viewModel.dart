import 'package:evsmart/models/DAO/event_DAO.dart';
import 'package:evsmart/models/DTO/event_model.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/viewModel/base_viewModel.dart';

import '../models/DAO/event_DAO.dart';

class EventDetailViewModel extends BaseModel {
  EventDAO? eventDAO;
  List<Event>? listEventDAO;
  EventDetailViewModel() {
    eventDAO = EventDAO();
  }

  Future<void> getEventDetail(String eventId) async {
    try {
      setState(ViewStatus.Loading);
      listEventDAO = await eventDAO?.getEvent(eventId: eventId);
      await Future.delayed(Duration(microseconds: 500));
      setState(ViewStatus.Completed);
    } catch (e) {
      listEventDAO = null;
      setState(ViewStatus.Completed);
    }
  }
}
