import 'package:evsmart/models/DTO/event_model.dart';
import 'package:evsmart/models/DTO/ticket_model.dart';

class TicketUser {
  String? id;
  Event? event;
  Ticket? ticket;
  String? name;
  String? description;
  String? type;
  DateTime? checkedInDate;
  DateTime? checkedOutDate;
  String? state;
  DateTime? createdDate;

  TicketUser(
      {this.id,
      this.event,
      this.ticket,
      this.name,
      this.description,
      this.type,
      this.checkedInDate,
      this.checkedOutDate,
      this.state,
      this.createdDate});

  TicketUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    event = json['event'] != null ? new Event.fromJson(json['event']) : null;
    ticket =
        json['ticket'] != null ? new Ticket.fromJson(json['ticket']) : null;
    name = json['name'];
    description = json['description'];
    type = json['type'];
    checkedInDate = json['checked-in-date'] != null
        ? DateTime.parse(json['checked-in-date'])
        : null;
    checkedOutDate = json['checked-out-date'] != null
        ? DateTime.parse(json['checked-out-date'])
        : null;
    state = json['state'];
    createdDate = DateTime.parse(json['created-date']);
  }

  static List<TicketUser> fromList(dynamic jsonList) {
    var list = jsonList as List<dynamic>;
    return list.map((map) => TicketUser.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.event != null) {
      data['event'] = this.event!.toJson();
    }
    if (this.ticket != null) {
      data['ticket'] = this.ticket!.toJson();
    }
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['checked-in-date'] = this.checkedInDate;
    data['checked-out-date'] = this.checkedOutDate;
    data['state'] = this.state;
    data['created-date'] = this.createdDate;
    return data;
  }
}


