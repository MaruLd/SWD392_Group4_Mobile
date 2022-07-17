import 'package:evsmart/models/DTO/eventAgenda_model.dart';
import 'package:dio/dio.dart';
import 'package:evsmart/models/DTO/eventDetail_model.dart';
import 'package:evsmart/networking/api_request.dart';

class EventDetailDAO {
  Future<EventDetail> getEventDetail({required final String eventId}) async {
    Response res;
    res = await request.get(
      'events/' + eventId,
    );
    final eventDetail = EventDetail.fromJson(res.data);

    return eventDetail;
  }
}
