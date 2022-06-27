import 'package:evsmart/models/DTO/event_model.dart';
import 'package:dio/dio.dart';
import 'package:evsmart/models/DTO/meta_data_dto.dart';
import 'package:evsmart/networking/api_request.dart';

class EventDAO {
  Future<List<Event>> getAllEvent({
    int page = 1,
    int size = 50,
    int? total,
    Map<String, dynamic> params = const {},
  }) async {
    Response res;
    res = await request.get(
      'events',
      queryParameters: {"page": page, "size": size}..addAll(params),
    );
    final events = Event.fromList(res.data);
    return events;
  }
}
