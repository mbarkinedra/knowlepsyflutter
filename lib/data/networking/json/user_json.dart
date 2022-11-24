import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class UserJson extends AbstractJsonResource{
  int? status;
  String? tokenType;
  User? user;
  String? token;
  String? refreshToken;
  String? expiredAt;

  UserJson(
      {this.status,
        this.tokenType,
        this.user,
        this.token,
        this.refreshToken,
        this.expiredAt});

  UserJson.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    tokenType = json['token_type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    refreshToken = json['refresh_token'];
    expiredAt = json['expired_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token_type'] = this.tokenType;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    data['refresh_token'] = this.refreshToken;
    data['expired_at'] = this.expiredAt;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? imageUrl;
  String? email;
  String? emailVerifiedAt;
  int? verifiedMail;
  String? role;
  int? enabled;
  int? trueAlert;
  int? falseAlert;
  String? phoneNumber;
  String? dateOfBirth;
  String? filedoctor;
  String? country;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.imageUrl,
        this.email,
        this.emailVerifiedAt,
        this.verifiedMail,
        this.role,
        this.enabled,
        this.trueAlert,
        this.falseAlert,
        this.phoneNumber,
        this.dateOfBirth,
        this.filedoctor,
        this.country,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    imageUrl = json['image_url'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    verifiedMail = json['verified_mail'];
    role = json['role'];
    enabled = json['enabled'];
    trueAlert = json['trueAlert'];
    falseAlert = json['falseAlert'];
    phoneNumber = json['phone_number'];
    dateOfBirth = json['date_of_birth'];
    filedoctor = json['filedoctor'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image_url'] = this.imageUrl;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['verified_mail'] = this.verifiedMail;
    data['role'] = this.role;
    data['enabled'] = this.enabled;
    data['trueAlert'] = this.trueAlert;
    data['falseAlert'] = this.falseAlert;
    data['phone_number'] = this.phoneNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['filedoctor'] = this.filedoctor;
    data['country'] = this.country;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
