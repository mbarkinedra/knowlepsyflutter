import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class GetAllCaregiverJson extends AbstractJsonResource {
  int? status;
  String? message;
  List<DataE>? data;

  GetAllCaregiverJson({this.status, this.message, this.data});

  GetAllCaregiverJson.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataE>[];
      json['data'].forEach((v) {
        data!.add(new DataE.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataE {
  int? id;
  int? seizureId;
  int? caregiverId;
  int? activeCaregiver;
  String? createdAt;
  String? updatedAt;
  Caregiverseizure? caregiverseizure;
  Seizurecaregiver? seizurecaregiver;

  DataE(
      {this.id,
        this.seizureId,
        this.caregiverId,
        this.activeCaregiver,
        this.createdAt,
        this.updatedAt,
        this.caregiverseizure,
        this.seizurecaregiver});

  DataE.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seizureId = json['seizure_id'];
    caregiverId = json['caregiver_id'];
    activeCaregiver = json['activeCaregiver'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    caregiverseizure = json['caregiverseizure'] != null
        ? new Caregiverseizure.fromJson(json['caregiverseizure'])
        : null;
    seizurecaregiver = json['seizurecaregiver'] != null
        ? new Seizurecaregiver.fromJson(json['seizurecaregiver'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seizure_id'] = this.seizureId;
    data['caregiver_id'] = this.caregiverId;
    data['activeCaregiver'] = this.activeCaregiver;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.caregiverseizure != null) {
      data['caregiverseizure'] = this.caregiverseizure!.toJson();
    }
    if (this.seizurecaregiver != null) {
      data['seizurecaregiver'] = this.seizurecaregiver!.toJson();
    }
    return data;
  }
}

class Caregiverseizure {
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
  String? phoneNumber;
  Null? dateOfBirth;
  Null? filedoctor;
  Null? country;
  String? createdAt;
  String? updatedAt;

  Caregiverseizure(
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

  Caregiverseizure.fromJson(Map<String, dynamic> json) {
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

class Seizurecaregiver {
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
  String? phoneNumber;
  String? dateOfBirth;
  Null? filedoctor;
  String? country;
  String? createdAt;
  String? updatedAt;

  Seizurecaregiver(
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

  Seizurecaregiver.fromJson(Map<String, dynamic> json) {
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
