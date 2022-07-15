import 'package:evsmart/models/DTO/eventAgenda_model.dart';
import 'package:dio/dio.dart';
import 'package:evsmart/networking/api_request.dart';

class EventAgendaDAO {
  Future<List<EventAgenda>> getEventAgenda({
    required final String eventId,
    Map<String, dynamic> params = const {},
  }) async {
    Response res;
    res = await request.get(
      'events/',
      queryParameters: {"eventId": eventId}..addAll(params),
    );
    final eventAgendas = EventAgenda.fromList(res.data);
    return eventAgendas;
  }
}
