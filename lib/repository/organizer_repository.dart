import 'package:evsmart/models/organizers_model.dart';
import 'package:evsmart/networking/api_provider.dart';

class OrganizerRepository {
  ApiProvider _provider = ApiProvider();

  Future<Organizers> fetchChuckJoke(String category) async {
    final response = await _provider.get("api/v1/organizer");
    return Organizers.fromJson(response);
  }
}
