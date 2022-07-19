import 'package:evsmart/models/DAO/ticket_DAO.dart';
import 'package:evsmart/models/DTO/ticketUser_model.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/viewModel/base_viewModel.dart';

class UserTicketViewModel extends BaseModel {
  TicketDAO? ticketDAO;
  Future<List<TicketUser>>? listTicket;
  UserTicketViewModel() {
    ticketDAO = TicketDAO();
  }

  Future<List<TicketUser>?> getTicket() async {
    try {
      return await ticketDAO?.getAllUserTicket();
    } catch (e) {
      listTicket = null;
    }
  }
}
