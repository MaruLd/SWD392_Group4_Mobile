import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
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
