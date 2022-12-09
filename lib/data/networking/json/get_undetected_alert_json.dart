import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class GetUndetectedAlertJson extends AbstractJsonResource {
  int? status;
  String? message;
  List<DataAlert>? data;

  GetUndetectedAlertJson({this.status, this.message, this.data});

  GetUndetectedAlertJson.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataAlert>[];
      json['data'].forEach((v) {
        data!.add(new DataAlert.fromJson(v));
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

class DataAlert {
  int? id;
  String? comment;
  String? time;
  String? date;
  int? seizureId;
  String? createdAt;
  String? updatedAt;

  DataAlert(
      {this.id,
        this.comment,
        this.time,
        this.date,
        this.seizureId,
        this.createdAt,
        this.updatedAt});

  DataAlert.fromJson(Map<String, dynamic> json) {
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
