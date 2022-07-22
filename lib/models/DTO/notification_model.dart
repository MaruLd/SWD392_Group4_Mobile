class NotificationDTO {
  Message? message;

  NotificationDTO({this.message});

  NotificationDTO.fromJson(Map<String, dynamic> json) {
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class Message {
  String? token;
  Notification? notification;
  Data? data;
  String? piority = "high";

  Message({this.token, this.notification, this.data, this.piority});

  Message.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    notification = json['notification'] != null
        ? Notification.fromJson(json['notification'])
        : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    piority = json['piority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (notification != null) {
      data['notification'] = notification!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['piority'] = piority;
    return data;
  }
}

class Notification {
  String? title;
  String? body;

  Notification({this.title, this.body});

  Notification.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}

class Data {
  String? clickAction = "FLUTTER_NOTIFICATION_CLICK";
  String? id = "1";
  String? status = "done";

  Data({this.clickAction, this.id, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    clickAction = json['click_action'];
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['click_action'] = clickAction;
    data['id'] = id;
    data['status'] = status;
    return data;
  }
}
