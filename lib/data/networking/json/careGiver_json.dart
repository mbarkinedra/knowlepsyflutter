import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class CareGiverJson extends  AbstractJsonResource {
  int? status;
  String? message;
  Data? data;

  CareGiverJson({this.status, this.message, this.data});

  CareGiverJson.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? imageUrl;
  int? verifiedMail;
  String? role;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.imageUrl,
        this.verifiedMail,
        this.role,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    imageUrl = json['image_url'];
    verifiedMail = json['verified_mail'];
    role = json['role'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['image_url'] = this.imageUrl;
    data['verified_mail'] = this.verifiedMail;
    data['role'] = this.role;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
