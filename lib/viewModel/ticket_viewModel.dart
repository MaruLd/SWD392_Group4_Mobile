import 'package:evsmart/models/DAO/ticket_DAO.dart';
import 'package:evsmart/models/DTO/ticket_model.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/viewModel/base_viewModel.dart';

class TicketViewModel extends BaseModel {
  TicketDAO? ticketDAO;
  List<Ticket>? listTicket;
  TicketViewModel() {
    ticketDAO = TicketDAO();
  }

  Future<void> getTicket() async {
    try {
      setState(ViewStatus.Loading);
      listTicket = await ticketDAO?.getAllTicket();
      await Future.delayed(Duration(microseconds: 500));
      setState(ViewStatus.Completed);
    } catch (e) {
      listTicket = null;
      setState(ViewStatus.Completed);
    }
  }
}
