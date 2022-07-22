class User {
  String? id;
  String? email;
  String? displayName;
  String? token;
  int? bean;
  String? imageUrl;

  User(
      {this.id,
        this.email,
        this.displayName,
        this.token,
        this.bean,
        this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    displayName = json['display-name'];
    token = json['token'];
    bean = json['bean'];
    imageUrl = json['image-url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['display-name'] = this.displayName;
    data['token'] = this.token;
    data['bean'] = this.bean;
    data['image-url'] = this.imageUrl;
    return data;
  }
}