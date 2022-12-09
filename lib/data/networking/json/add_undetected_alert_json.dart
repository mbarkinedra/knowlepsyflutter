import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class AddUndetectedAlertJson extends AbstractJsonResource {
  int? status;
  String? message;
  Data? data;

  AddUndetectedAlertJson({this.status, this.message, this.data});

  AddUndetectedAlertJson.fromJson(Map<String, dynamic> json) {
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
  String? comment;
  String? time;
  String? date;
  int? seizureId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.comment,
      this.time,
      this.date,
      this.seizureId,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    time = json['time'];
    date = json['date'];
    seizureId = json['seizure_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['time'] = this.time;
    data['date'] = this.date;
    data['seizure_id'] = this.seizureId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
