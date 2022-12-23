import 'abstract__json_resource.dart';

class GetModifMedecationsJson extends AbstractJsonResource {
  int? status;
  String? message;
  Data? data;

  GetModifMedecationsJson({this.status, this.message, this.data});

  GetModifMedecationsJson.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? time;
  String? date;
  String? quantity;
  String? dosage;
  int? stateMedication;
  Null? medicationByType;
  int? seizureId;
  int? reminderMe;
  String? createdAt;
  String? updatedAt;
  Seisuremedications? seisuremedications;

  Data(
      {this.id,
        this.name,
        this.time,
        this.date,
        this.quantity,
        this.dosage,
        this.stateMedication,
        this.medicationByType,
        this.seizureId,
        this.reminderMe,
        this.createdAt,
        this.updatedAt,
        this.seisuremedications});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    date = json['date'];
    quantity = json['quantity'];
    dosage = json['dosage'];
    stateMedication = json['state_medication'];
    medicationByType = json['medicationByType'];
    seizureId = json['seizure_id'];
    reminderMe = json['reminder_me'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    seisuremedications = json['seisuremedications'] != null
        ? new Seisuremedications.fromJson(json['seisuremedications'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['time'] = this.time;
    data['date'] = this.date;
    data['quantity'] = this.quantity;
    data['dosage'] = this.dosage;
    data['state_medication'] = this.stateMedication;
    data['medicationByType'] = this.medicationByType;
    data['seizure_id'] = this.seizureId;
    data['reminder_me'] = this.reminderMe;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.seisuremedications != null) {
      data['seisuremedications'] = this.seisuremedications!.toJson();
    }
    return data;
  }
}

class Seisuremedications {
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

  Seisuremedications(
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

  Seisuremedications.fromJson(Map<String, dynamic> json) {
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
