import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class VerifCodePasswordJson extends AbstractJsonResource {
  int? status;
  String? message;
  String? data;

  VerifCodePasswordJson({this.status, this.message, this.data});

  VerifCodePasswordJson.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
