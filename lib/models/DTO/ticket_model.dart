class Ticket {
  String? id;
  String? eventId;
  String? ticketId;
  String? name;
  String? description;
  String? type;
  DateTime? checkedInDate;
  DateTime? checkedOutDate;
  String? state;
  DateTime? createdDate;

  Ticket(
      {this.id,
      this.eventId,
      this.ticketId,
      this.name,
      this.description,
      this.type,
      this.checkedInDate,
      this.checkedOutDate,
      this.state,
      this.createdDate});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event-id'];
    ticketId = json['ticket-id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    checkedInDate = DateTime.parse(json['checked-in-date']);
    checkedOutDate = DateTime.parse(json['checked-out-date']);
    state = json['state'];
    createdDate = DateTime.parse(json['created-date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event-id'] = this.eventId;
    data['ticket-id'] = this.ticketId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['checked-in-date'] = this.checkedInDate;
    data['checked-out-date'] = this.checkedOutDate;
    data['state'] = this.state;
    data['created-date'] = this.createdDate;
    return data;
  }

  static List<Ticket> fromList(dynamic jsonList) {
    var list = jsonList as List<dynamic>;
    return list.map((map) => Ticket.fromJson(map)).toList();
  }
}
