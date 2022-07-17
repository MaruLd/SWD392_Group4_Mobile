import 'package:evsmart/models/DTO/eventAgenda_model.dart';
import 'package:dio/dio.dart';
import 'package:evsmart/networking/api_request.dart';

class EventAgendaDAO {
  Future<List<EventAgenda>> getEventAgenda(
      {required final String eventId}) async {
    Response res;
    res = await request.get(
      'events/' + eventId + '/agenda',
    );
    final eventAgendas = EventAgenda.fromList(res.data);

    return eventAgendas;
  }
}
