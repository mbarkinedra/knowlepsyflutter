import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class GetAlertByTypeJson extends AbstractJsonResource {
  int? status;
  String? message;
  List<Data>? data;

  GetAlertByTypeJson({this.status, this.message, this.data});

  GetAlertByTypeJson.fromJson(Map<String, dynamic> json) {
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
  List<Alerts>? alerts;

  Data({this.alerts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['alerts'] != null) {
      alerts = <Alerts>[];
      json['alerts'].forEach((v) {
        alerts!.add(new Alerts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.alerts != null) {
      data['alerts'] = this.alerts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Alerts {
  int? id;
  String? comment;
  String? duration;
  int? type;
  int? ficheSeizureId;
  String? createdAt;
  String? updatedAt;

  Alerts(
      {this.id,
        this.comment,
        this.duration,
        this.type,
        this.ficheSeizureId,
        this.createdAt,
        this.updatedAt});

  Alerts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    duration = json['duration'];
    type = json['type'];
    ficheSeizureId = json['fiche_seizure_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['duration'] = this.duration;
    data['type'] = this.type;
    data['fiche_seizure_id'] = this.ficheSeizureId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
