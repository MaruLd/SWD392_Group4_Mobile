class EventAgenda {
  String? id;
  String? eventId;
  String? title;
  String? description;
  DateTime? startTime;
  DateTime? endTime;
  DateTime? createdDate;

  EventAgenda(
      {this.id,
      this.eventId,
      this.title,
      this.description,
      this.startTime,
      this.endTime,
      this.createdDate});

  EventAgenda.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event-id'];
    title = json['title'];
    description = json['description'];
    startTime =  DateTime.parse(json['start-time']);
    endTime = DateTime.parse(json['end-time']);
    createdDate = DateTime.parse(json['created-date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event-id'] = this.eventId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['start-time'] = this.startTime;
    data['end-time'] = this.endTime;
    data['created-date'] = this.createdDate;
    return data;
  }

  static List<EventAgenda> fromList(dynamic jsonList) {
    var list = jsonList as List<dynamic>;
    return list.map((map) => EventAgenda.fromJson(map)).toList();
  }
}
