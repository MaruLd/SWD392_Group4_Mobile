import 'package:evsmart/models/DAO/ticket_DAO.dart';
import 'package:evsmart/models/DTO/userTicket_model.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/viewModel/base_viewModel.dart';

class UserTicketViewModel extends BaseModel {
  TicketDAO? ticketDAO;
  Future<List<UserTicket>>? listTicket;
  UserTicketViewModel() {
    ticketDAO = TicketDAO();
  }

  Future<List<UserTicket>?> getTicket() async {
    try {
      return await ticketDAO?.getAllUserTicket();
    } catch (e) {
      listTicket = null;
    }
  }
}
