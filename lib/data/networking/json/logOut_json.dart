import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

class LogOutJson extends AbstractJsonResource{
  int? status;
  String? message;
  String? data;

  LogOutJson({this.status, this.message, this.data});

  LogOutJson.fromJson(Map<String, dynamic> json) {
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
