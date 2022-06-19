import 'dart:convert';
import 'dart:io';

import 'package:evsmart/models/event_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static const String uri = "https://evsmart.herokuapp.com/api/v1/events";

  static List<Event> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Event> events = list.map((model) => Event.fromJson(model)).toList();
    return events;
  }

  static Future<List<Event>> fetchPost({int page = 1}) async {
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 404) {
      throw Exception("Not found");
    } else {
      throw Exception("Can't get events");
    }
  }
}
