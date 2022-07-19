class Ticket {
  String? id;
  String? eventId;
  String? name;
  String? description;
  String? type;
  int? cost;
  int? quantity;
  int? quantityLeft;
  DateTime? createdDate;

  Ticket(
      {this.id,
      this.eventId,
      this.name,
      this.description,
      this.type,
      this.cost,
      this.quantity,
      this.quantityLeft,
      this.createdDate});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event-id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    cost = json['cost'];
    quantity = json['quantity'];
    quantityLeft = json['quantity-left'];
    createdDate = DateTime.parse(json['created-date']);
  }

  static List<Ticket> fromList(dynamic jsonList) {
    var list = jsonList as List<dynamic>;
    return list.map((map) => Ticket.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event-id'] = this.eventId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['cost'] = this.cost;
    data['quantity'] = this.quantity;
    data['quantity-left'] = this.quantityLeft;
    data['created-date'] = this.createdDate;
    return data;
  }
}
