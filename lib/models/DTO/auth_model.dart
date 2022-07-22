class AuthDTO {
  String? id;
  String? displayName;
  String? email;
  String? token;
  String? role;
  String? image;

  AuthDTO(
      {this.id,
      this.displayName,
      this.email,
      this.token,
      this.role,
      this.image});

  AuthDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['display-name'];
    email = json['email'];
    token = json['token'];
    role = json['role'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['display-name'] = this.displayName;
    data['email'] = this.email;
    data['token'] = this.token;
    data['role'] = this.role;
    data['image'] = this.image;
    return data;
  }

}
