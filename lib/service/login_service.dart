import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:signup_demo/models/login_model.dart';

class LogInService {


  static Future<http.Response> logIn(
       email,  password,  {context, emailController}) async {
    Uri url = Uri.parse(
        'https://libraryapiapp.azurewebsites.net/api/Login/login-student');
    http.Response response = await http.post(
        url,
        body: jsonEncode(LogInModel.toJson(email, password)),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );
    if(response.statusCode != 200)
      {
        SnackBar snackBar = const SnackBar(
            content: Text('Wrong Email or Password'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    print('logIn status Code: ${response.statusCode}');
    print('logIn body: ${response.body}');
    return response ;
  }
}
