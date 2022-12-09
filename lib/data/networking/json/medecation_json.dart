


import 'abstract__json_resource.dart';

class AddMedicationJson extends AbstractJsonResource {
  int? status;
  String? message;
  Data? data;

  AddMedicationJson({this.status, this.message, this.data});

  AddMedicationJson.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? time;
  String? quantity;
  String? dosage;
  String? typeQuantity;
  String? typeDosage;
  int? seizureId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.name,
        this.time,
        this.quantity,
        this.dosage,
        this.typeQuantity,
        this.typeDosage,
        this.seizureId,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['time'];
    quantity = json['quantity'];
    dosage = json['dosage'];
    typeQuantity = json['type_quantity'];
    typeDosage = json['type_dosage'];
    seizureId = json['seizure_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['time'] = this.time;
    data['quantity'] = this.quantity;
    data['dosage'] = this.dosage;
    data['type_quantity'] = this.typeQuantity;
    data['type_dosage'] = this.typeDosage;
    data['seizure_id'] = this.seizureId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
