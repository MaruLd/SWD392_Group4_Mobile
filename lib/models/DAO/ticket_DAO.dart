import 'package:evsmart/models/DTO/ticket_model.dart';
import 'package:dio/dio.dart';
import 'package:evsmart/networking/api_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TicketDAO {
  Future<List<Ticket>> getAllTicket({
    int page = 1,
    int size = 10,
    int? total,
    Map<String, dynamic> params = const {},
  }) async {
    Response res;
    
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    res = await request.get('user/me/tickets',
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ));
    final events = Ticket.fromList(res.data);
    return events;
  }
}
