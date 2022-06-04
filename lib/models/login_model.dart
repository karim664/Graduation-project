import 'dart:convert';

import 'package:signup_demo/models/student_model.dart';

class LogInModel {
  String? email;
  String? password;

  LogInModel({this.email, this.password});

  LogInModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

 static List<StudentModel>getLogInInfo(String body){
    List<dynamic> jsonData = jsonDecode(body);
    List<StudentModel> loginInfo = [];
    for(int i=0; i<jsonData.length; i++)
      {
        loginInfo.add(StudentModel.fromJson(jsonData[i]));
      }
    return loginInfo ;
  }

  static Map<String, dynamic> toJson(email, password) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}