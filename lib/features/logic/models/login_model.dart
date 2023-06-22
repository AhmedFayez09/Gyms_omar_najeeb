class LoginModel {
  User? user;
  String? token;

  LoginModel({this.user, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? sId;
  String? username;
  String? homeLocation;
  String? phone;
  String? email;
  String? gender;
  String? role;
  int? code;
  int? iV;
  int? wallet;

  User(
      {this.sId,
      this.username,
      this.homeLocation,
      this.phone,
      this.email,
      this.gender,
      this.role,
      this.code,
      this.iV,
      this.wallet});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    homeLocation = json['home_location'];
    phone = json['phone'];
    email = json['email'];
    gender = json['gender'];
    role = json['role'];
    code = json['code'];
    iV = json['__v'];
    wallet = json['wallet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['home_location'] = this.homeLocation;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['role'] = this.role;
    data['code'] = this.code;
    data['__v'] = this.iV;
    data['wallet'] = this.wallet;
    return data;
  }
}
