class UserModel {
  bool? error;
  String? message;
  User? user;

  UserModel({this.error, this.message, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? password;

  User(
      {this.id, this.name, this.email, this.phone, this.image, this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    password = json['password'];
  }
}
