import 'package:json_annotation/json_annotation.dart';

import 'event_category_model.dart';
import 'organizers_model.dart';

@JsonSerializable(createToJson: false)
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
  List<Organizers>? organizers;
  EventCategory? eventCategory;

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
    if (json['organizers'] != null) {
      organizers = <Organizers>[];
      json['organizers'].forEach((v) {
        organizers!.add(new Organizers.fromJson(v));
      });
    }
    eventCategory = json['event-category'] != null
        ? new EventCategory.fromJson(json['event-category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['location'] = this.location;
    data['start-time'] = this.startTime;
    data['end-time'] = this.endTime;
    data['multiplier-factor'] = this.multiplierFactor;
    data['created-date'] = this.createdDate;
    data['state'] = this.state;
    if (this.organizers != null) {
      data['organizers'] = this.organizers!.map((v) => v.toJson()).toList();
    }
    if (this.eventCategory != null) {
      data['event-category'] = this.eventCategory!.toJson();
    }
    return data;
  }
}
