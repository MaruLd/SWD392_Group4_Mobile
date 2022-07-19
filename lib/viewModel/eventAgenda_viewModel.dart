import 'package:evsmart/models/DAO/eventAgenda_DAO.dart';
import 'package:evsmart/models/DTO/eventAgenda_model.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/viewModel/base_viewModel.dart';

class EventAgendaViewModel extends BaseModel {
  EventAgendaDAO? eventAgendaDAO;
  List<EventAgenda>? listEventAgenda;
  EventAgendaViewModel() {
    eventAgendaDAO = EventAgendaDAO();
  }

  Future<void> getEventAgenda(String eventId) async {
    try {
      listEventAgenda = await eventAgendaDAO?.getEventAgenda(eventId: eventId);
    } catch (e) {
      listEventAgenda = null;
    }
  }
}
