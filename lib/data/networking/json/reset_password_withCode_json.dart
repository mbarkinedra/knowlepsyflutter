import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class ResetPasswordWithCodeJson extends AbstractJsonResource{
  int? status;
  String? message;
  Data? data;

  ResetPasswordWithCodeJson({this.status, this.message, this.data});

  ResetPasswordWithCodeJson.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json[' data'] != null ? new Data.fromJson(json[' data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data[' data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? role;
  String? email;
  String? emailVerifiedAt;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? imageUrl;
  String? dateOfBirth;
  String? country;
  bool? enabled;
  bool? verifiedMail;

  Data(
      {this.id,
        this.role,
        this.email,
        this.emailVerifiedAt,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.imageUrl,
        this.dateOfBirth,
        this.country,
        this.enabled,
        this.verifiedMail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    imageUrl = json['image_url'];
    dateOfBirth = json['date_of_birth'];
    country = json['country'];
    enabled = json['enabled'];
    verifiedMail = json['verified_mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['image_url'] = this.imageUrl;
    data['date_of_birth'] = this.dateOfBirth;
    data['country'] = this.country;
    data['enabled'] = this.enabled;
    data['verified_mail'] = this.verifiedMail;
    return data;
  }
}
