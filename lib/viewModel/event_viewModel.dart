import 'package:evsmart/models/DAO/event_DAO.dart';
import 'package:evsmart/models/DTO/event_model.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/viewModel/base_viewModel.dart';

class EventViewModel extends BaseModel {
  EventDAO? eventDAO;
  List<Event>? listEvent;
  EventViewModel() {
    eventDAO = EventDAO();
  }

  Future<void> getEvent() async {
    try {
      setState(ViewStatus.Loading);
      listEvent = await eventDAO?.getAllEvent();
      await Future.delayed(Duration(microseconds: 500));
      setState(ViewStatus.Completed);
    } catch (e) {
      listEvent = null;
      setState(ViewStatus.Completed);
    }
  }
}
