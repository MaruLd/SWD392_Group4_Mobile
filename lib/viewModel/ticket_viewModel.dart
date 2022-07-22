import 'package:evsmart/models/DAO/ticket_DAO.dart';
import 'package:evsmart/models/DTO/userTicket_model.dart';
import 'package:evsmart/models/DTO/ticket_model.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/viewModel/base_viewModel.dart';

class TicketViewModel extends BaseModel {
  TicketDAO? ticketDAO;
  Future<List<Ticket>>? listTicket;
  TicketViewModel() {
    ticketDAO = TicketDAO();
  }

  Future<List<Ticket>?> getTicket(String eventId) async {
    try {
      return await ticketDAO?.getEventTicket(eventId: eventId);
    } catch (e) {
      listTicket = null;
    }
  }
}
