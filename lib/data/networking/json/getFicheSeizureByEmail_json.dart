import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class GetFicheSeizureByEmailJson extends AbstractJsonResource {
  int? status;
  String? message;
  List<Data>? data;

  GetFicheSeizureByEmailJson({this.status, this.message, this.data});

  GetFicheSeizureByEmailJson.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? temperature;
  String? heartRate;
  String? skinConduvtivity;
  String? motionSensing;
  String? otherTbd;
  String? eDA;
  String? phase;
  String? time;
  String? date;
  int? seizureId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.temperature,
        this.heartRate,
        this.skinConduvtivity,
        this.motionSensing,
        this.otherTbd,
        this.eDA,
        this.phase,
        this.time,
        this.date,
        this.seizureId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    temperature = json['temperature'];
    heartRate = json['heart_rate'];
    skinConduvtivity = json['skin_conduvtivity'];
    motionSensing = json['motion_sensing'];
    otherTbd = json['other_tbd'];
    eDA = json['EDA'];
    phase = json['phase'];
    time = json['time'];
    date = json['date'];
    seizureId = json['seizure_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['temperature'] = this.temperature;
    data['heart_rate'] = this.heartRate;
    data['skin_conduvtivity'] = this.skinConduvtivity;
    data['motion_sensing'] = this.motionSensing;
    data['other_tbd'] = this.otherTbd;
    data['EDA'] = this.eDA;
    data['phase'] = this.phase;
    data['time'] = this.time;
    data['date'] = this.date;
    data['seizure_id'] = this.seizureId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
