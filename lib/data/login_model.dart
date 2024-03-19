import 'package:task_manager_project_in_flutter/data/user_data_login_part.dart';

class LoginResponse {
  String? status;
  String? token;
  UserData? userdata;

  LoginResponse({this.status, this.token, this.userdata});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    userdata = json['data'] != null ? new UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (this.userdata != null) {
      data['data'] = this.userdata!.toJson();
    }
    return data;
  }
}



