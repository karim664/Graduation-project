import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:signup_demo/service/login_service.dart';
import '../../network/network_local/shared_pref.dart';
import 'package:http/http.dart' as http;


class LogInNotifier extends ChangeNotifier {
  bool isLogin = false;
  Map<String, dynamic>? jsonData ;

  Future<http.Response> postLogIn(email, password, context) async {
    http.Response response = await LogInService.logIn(email, password, context: context).then((value) {
      jsonData = jsonDecode(value.body);
      SharedPref.setString('loginUserDetail', value.body);

      return value;
    });
    return response ;
  }

  void logInChangeState() {
    isLogin = true;
    SharedPref.setBoolean('login', isLogin);
  }

  saveStudentInfo(email, password)
  {
    SharedPref.setString('emailInfo', email);
    SharedPref.setString('passwordInfo', password);
  }
}
