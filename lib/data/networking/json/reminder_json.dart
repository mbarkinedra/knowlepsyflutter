import 'abstract__json_resource.dart';

class AddReminderJson extends AbstractJsonResource{
  int? status;
  String? message;
  Data? data;

  AddReminderJson({this.status, this.message, this.data});

  AddReminderJson.fromJson(Map<String, dynamic> json) {
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
  String? typeDosage;
  String? typeQuantity;
  int? stateMedication;
  Null? medicationByType;
  int? seizureId;
  String? reminderMe;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.time,
        this.date,
        this.quantity,
        this.dosage,
        this.typeDosage,
        this.typeQuantity,
        this.stateMedication,
        this.medicationByType,
        this.seizureId,
        this.reminderMe,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    date = json['date'];
    quantity = json['quantity'];
    dosage = json['dosage'];
    typeDosage = json['type_dosage'];
    typeQuantity = json['type_quantity'];
    stateMedication = json['state_medication'];
    medicationByType = json['medicationByType'];
    seizureId = json['seizure_id'];
    reminderMe = json['reminder_me'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['time'] = this.time;
    data['date'] = this.date;
    data['quantity'] = this.quantity;
    data['dosage'] = this.dosage;
    data['type_dosage'] = this.typeDosage;
    data['type_quantity'] = this.typeQuantity;
    data['state_medication'] = this.stateMedication;
    data['medicationByType'] = this.medicationByType;
    data['seizure_id'] = this.seizureId;
    data['reminder_me'] = this.reminderMe;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
