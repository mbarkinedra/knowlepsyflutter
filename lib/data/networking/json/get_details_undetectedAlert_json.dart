import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class GetUndetectedAlertDetailsJson extends AbstractJsonResource{
  int? status;
  String? message;
  Data? data;

  GetUndetectedAlertDetailsJson({this.status, this.message, this.data});

  GetUndetectedAlertDetailsJson.fromJson(Map<String, dynamic> json) {
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
  String? comment;
  String? time;
  String? date;
  int? seizureId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.comment,
        this.time,
        this.date,
        this.seizureId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    time = json['time'];
    date = json['date'];
    seizureId = json['seizure_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['time'] = this.time;
    data['date'] = this.date;
    data['seizure_id'] = this.seizureId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
