import 'package:evsmart/models/event_model.dart';
import 'package:evsmart/networking/api_provider.dart';

class EventRepository {
  ApiProvider _provider = ApiProvider();

  Future<Event> fetchChuckJoke(String category) async {
    final response = await _provider.get("api/v1/event");
    return Event.fromJson(response);
  }
}