import 'category_model.dart';
import 'organizers_model.dart';

class Event {
  String? id;
  String? title;
  String? description;
  String? imageUrl;
  String? location;
  String? startTime;
  String? endTime;
  int? multiplierFactor;
  String? createdDate;
  String? state;
  String? userType;
  List<Organizer>? organizers;
  Category? eventCategory;

  Event(
      {this.id,
      this.title,
      this.description,
      this.imageUrl,
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
    imageUrl = json['image-url'];
    location = json['location'];
    startTime = json['start-time'];
    endTime = json['end-time'];
    multiplierFactor = json['multiplier-factor'];
    createdDate = json['created-date'];
    state = json['state'];
    userType = json['user-type'];
    if (json['organizers'] != null) {
      organizers = <Organizer>[];
      json['organizers'].forEach((v) {
        organizers!.add(new Organizer.fromJson(v));
      });
    }
    eventCategory = json['event-category'] != null
        ? new Category.fromJson(json['event-category'])
        : null;
  }

  static List<Event> fromList(dynamic jsonList) {
    var list = jsonList as List;
    return list.map((map) => Event.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image-url'] = this.imageUrl;
    data['location'] = this.location;
    data['start-time'] = this.startTime;
    data['end-time'] = this.endTime;
    data['multiplier-factor'] = this.multiplierFactor;
    data['created-date'] = this.createdDate;
    data['state'] = this.state;
    data['user-type'] = this.userType;
    if (this.organizers != null) {
      data['organizers'] = this.organizers!.map((v) => v.toJson()).toList();
    }
    if (this.eventCategory != null) {
      data['event-category'] = this.eventCategory!.toJson();
    }
    return data;
  }
}
