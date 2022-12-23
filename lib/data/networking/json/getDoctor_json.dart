import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class GetDoctorJson extends AbstractJsonResource {
  int? status;
  String? message;
  List<DataD>? data;

  GetDoctorJson({this.status, this.message, this.data});

  GetDoctorJson.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataD>[];
      json['data'].forEach((v) {
        data!.add(new DataD.fromJson(v));
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

class DataD {
  int? id;
  String? matricule;
  int? seizureId;
  int? doctorId;
  String? stateSeizure;
  int? stateDoctor;
  String? createdAt;
  String? updatedAt;
  Doctorconsultation? doctorconsultation;

  DataD(
      {this.id,
        this.matricule,
        this.seizureId,
        this.doctorId,
        this.stateSeizure,
        this.stateDoctor,
        this.createdAt,
        this.updatedAt,
        this.doctorconsultation});

  DataD.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matricule = json['matricule'];
    seizureId = json['seizure_id'];
    doctorId = json['doctor_id'];
    stateSeizure = json['state_seizure'];
    stateDoctor = json['state_doctor'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    doctorconsultation = json['doctorconsultation'] != null
        ? new Doctorconsultation.fromJson(json['doctorconsultation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['matricule'] = this.matricule;
    data['seizure_id'] = this.seizureId;
    data['doctor_id'] = this.doctorId;
    data['state_seizure'] = this.stateSeizure;
    data['state_doctor'] = this.stateDoctor;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.doctorconsultation != null) {
      data['doctorconsultation'] = this.doctorconsultation!.toJson();
    }
    return data;
  }
}

class Doctorconsultation {
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
  String? phoneNumber;
  String? dateOfBirth;
  Null? filedoctor;
  int? stateDoctor;
  String? country;
  String? createdAt;
  String? updatedAt;

  Doctorconsultation(
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
        this.stateDoctor,
        this.country,
        this.createdAt,
        this.updatedAt});

  Doctorconsultation.fromJson(Map<String, dynamic> json) {
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
    stateDoctor = json['state_doctor'];
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
    data['state_doctor'] = this.stateDoctor;
    data['country'] = this.country;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
