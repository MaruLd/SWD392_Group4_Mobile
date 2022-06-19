import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
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
