import 'category_model.dart';
import 'organizers_model.dart';

class Event {
  String? id;
  String? title;
  String? description;
  String? location;
  String? startTime;
  String? endTime;
  int? multiplierFactor;
  String? createdDate;
  String? state;
  String? userType;
  List<Organizers>? organizers;
  Category? eventCategory;

  Event(
      {this.id,
      this.title,
      this.description,
      this.location,
      this.startTime,
      this.endTime,
      this.multiplierFactor,
      this.createdDate,
      this.state,
      this.userType,
      this.organizers,
      this.eventCategory});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    location = json['location'];
    startTime = json['start-time'];
    endTime = json['end-time'];
    multiplierFactor = json['multiplier-factor'];
    createdDate = json['created-date'];
    state = json['state'];
    userType = json['user-type'];
    if (json['organizers'] != null) {
      organizers = <Organizers>[];
      json['organizers'].forEach((v) {
        organizers!.add(Organizers.fromJson(v));
      });
    }
    eventCategory = json['event-category'] != null
        ? Category.fromJson(json['event-category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['location'] = location;
    data['start-time'] = startTime;
    data['end-time'] = endTime;
    data['multiplier-factor'] = multiplierFactor;
    data['created-date'] = createdDate;
    data['state'] = state;
    data['user-type'] = userType;
    if (organizers != null) {
      data['organizers'] = organizers!.map((v) => v.toJson()).toList();
    }
    if (eventCategory != null) {
      data['event-category'] = eventCategory!.toJson();
    }
    return data;
  }
}
