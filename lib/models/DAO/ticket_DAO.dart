import 'package:evsmart/Authentication/google_sign_in.dart';
import 'package:evsmart/models/DTO/ticket_model.dart';
import 'package:dio/dio.dart';
import 'package:evsmart/networking/api_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TicketDAO {
  Future<List<Ticket>> getAllTicket({
    int page = 1,
    int size = 5,
    int? total,
    Map<String, dynamic> params = const {},
  }) async {
    Response res;
    var token = await GoogleSignInProvider.getAndStoreJwtToken();
    res = await request.get(
      'user/me/tickets',
      options: Options(
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        },
      ),
      queryParameters: {"page": page, "size": size}..addAll(params),
    );
    final tickets = Ticket.fromList(res.data);
    return tickets;
  }
}
