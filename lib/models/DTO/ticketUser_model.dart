import 'user_model.dart';

class TicketUser {
  User? user;
  String? createdDate;
  String? checkedInDate;
  String? checkedOutDate;
  String? state;

  TicketUser(
      {this.user,
      this.createdDate,
      this.checkedInDate,
      this.checkedOutDate,
      this.state});

  TicketUser.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdDate = json['created-date'];
    checkedInDate = json['checked-in-date'];
    checkedOutDate = json['checked-out-date'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['created-date'] = this.createdDate;
    data['checked-in-date'] = this.checkedInDate;
    data['checked-out-date'] = this.checkedOutDate;
    data['state'] = this.state;
    return data;
  }
}
