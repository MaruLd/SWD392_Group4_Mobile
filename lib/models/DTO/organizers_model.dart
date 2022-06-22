class Organizer {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  DateTime? createdDate;

  Organizer(
      {this.id, this.name, this.description, this.imageUrl, this.createdDate});

  Organizer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['image-url'];
    createdDate = DateTime.parse(json['created-date']);
  }

  static List<Organizer> fromList(dynamic jsonList) {
    var list = jsonList as List;
    return list.map((map) => Organizer.fromJson(map)).toList();
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
