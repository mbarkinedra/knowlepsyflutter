import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class AddDoctorJson extends AbstractJsonResource {
  int? status;
  String? message;
  Data? data;

  AddDoctorJson({this.status, this.message, this.data});

  AddDoctorJson.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? firstName;
  String? lastName;
  String? imageUrl;
  String? email;
  Null? emailVerifiedAt;
  int? verifiedMail;
  String? role;
  int? enabled;
  int? trueAlert;
  int? falseAlert;
  int? nbrUndetectedAlert;
  Null? phoneNumber;
  Null? dateOfBirth;
  Null? filedoctor;
  Null? country;
  String? createdAt;
  String? updatedAt;

  Data(
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
      this.nbrUndetectedAlert,
      this.phoneNumber,
      this.dateOfBirth,
      this.filedoctor,
      this.country,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
    nbrUndetectedAlert = json['nbr_undetectedAlert'];
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
    data['nbr_undetectedAlert'] = this.nbrUndetectedAlert;
    data['phone_number'] = this.phoneNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['filedoctor'] = this.filedoctor;
    data['country'] = this.country;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
