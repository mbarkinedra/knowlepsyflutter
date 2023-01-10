import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class GetFicheSeizureDetailsJson extends AbstractJsonResource{
  int? status;
  String? message;
  Data? data;

  GetFicheSeizureDetailsJson({this.status, this.message, this.data});

  GetFicheSeizureDetailsJson.fromJson(Map<String, dynamic> json) {
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
  String? temperature;
  String? heartRate;
  String? skinConduvtivity;
  String? motionSensing;
  String? otherTbd;
  int? seizureId;
  String? createdAt;
  String? updatedAt;
  Siezurefiche? siezurefiche;

  Data(
      {this.id,
        this.temperature,
        this.heartRate,
        this.skinConduvtivity,
        this.motionSensing,
        this.otherTbd,
        this.seizureId,
        this.createdAt,
        this.updatedAt,
        this.siezurefiche});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    temperature = json['temperature'];
    heartRate = json['heart_rate'];
    skinConduvtivity = json['skin_conduvtivity'];
    motionSensing = json['motion_sensing'];
    otherTbd = json['other_tbd'];
    seizureId = json['seizure_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    siezurefiche = json['siezurefiche'] != null
        ? new Siezurefiche.fromJson(json['siezurefiche'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['temperature'] = this.temperature;
    data['heart_rate'] = this.heartRate;
    data['skin_conduvtivity'] = this.skinConduvtivity;
    data['motion_sensing'] = this.motionSensing;
    data['other_tbd'] = this.otherTbd;
    data['seizure_id'] = this.seizureId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.siezurefiche != null) {
      data['siezurefiche'] = this.siezurefiche!.toJson();
    }
    return data;
  }
}

class Siezurefiche {
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

  Siezurefiche(
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

  Siezurefiche.fromJson(Map<String, dynamic> json) {
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
