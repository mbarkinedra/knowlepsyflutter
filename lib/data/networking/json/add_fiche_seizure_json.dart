import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class AddFicheSeizureJson extends AbstractJsonResource{
  int? status;
  String? message;
  Data? data;

  AddFicheSeizureJson({this.status, this.message, this.data});

  AddFicheSeizureJson.fromJson(Map<String, dynamic> json) {
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
  String? temperature;
  String? heartRate;
  String? skinConduvtivity;
  int? seizureId;
  String? motionSensing;
  String? otherTbd;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.temperature,
        this.heartRate,
        this.skinConduvtivity,
        this.seizureId,
        this.motionSensing,
        this.otherTbd,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    heartRate = json['heart_rate'];
    skinConduvtivity = json['skin_conduvtivity'];
    seizureId = json['seizure_id'];
    motionSensing = json['motion_sensing'];
    otherTbd = json['other_tbd'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temperature'] = this.temperature;
    data['heart_rate'] = this.heartRate;
    data['skin_conduvtivity'] = this.skinConduvtivity;
    data['seizure_id'] = this.seizureId;
    data['motion_sensing'] = this.motionSensing;
    data['other_tbd'] = this.otherTbd;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
