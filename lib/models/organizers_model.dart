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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image-url'] = imageUrl;
    data['created-date'] = createdDate;
    return data;
  }
}
