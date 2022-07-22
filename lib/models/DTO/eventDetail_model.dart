class EventDetail {
  String? id;
  String? title;
  String? description;
  String? imageUrl;
  String? location;
  DateTime? startTime;
  DateTime? endTime;
  int? multiplierFactor;
  DateTime? createdDate;
  String? state;
  List<Organizers>? organizers;
  EventCategory? eventCategory;

  EventDetail(
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
      this.organizers,
      this.eventCategory});

  EventDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['image-url'];
    location = json['location'];
    startTime = DateTime.parse(json['start-time']);
    endTime = DateTime.parse(json['end-time']);
    multiplierFactor = json['multiplier-factor'];
    createdDate = DateTime.parse(json['created-date']);
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

  static List<EventDetail> fromList(dynamic jsonList) {
    var list = jsonList as List<dynamic>;
    return list.map((map) => EventDetail.fromJson(map)).toList();
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
    if (this.organizers != null) {
      data['organizers'] = this.organizers!.map((v) => v.toJson()).toList();
    }
    if (this.eventCategory != null) {
      data['event-category'] = this.eventCategory!.toJson();
    }
    return data;
  }
}

class Organizers {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? createdDate;

  Organizers(
      {this.id, this.name, this.description, this.imageUrl, this.createdDate});

  Organizers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['image-url'];
    createdDate = json['created-date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image-url'] = this.imageUrl;
    data['created-date'] = this.createdDate;
    return data;
  }
}

class EventCategory {
  int? id;
  String? name;

  EventCategory({this.id, this.name});

  EventCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
