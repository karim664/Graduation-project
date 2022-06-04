import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:signup_demo/models/student_model.dart';

class StudentService {

  static Future<http.Response> getStudent() async {
    Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/Student');
    http.Response response = await http.get(url);
    print('Get Students status code: ${response.statusCode}');
    return response;
  }


  static Future<http.Response> getStudentById(int id)async
  {
    Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/Student/$id');
    http.Response response = await http.get(url);
    print('get student by id status code: ${response.statusCode}');
    return response ;
  }

  static Future<http.Response> addStudent(
      {required String title, required String phone, required String password, required String natid, required String email, required String? address,}) async
  {
    Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/Student');
    http.Response response = await http.post(url,
        body: jsonEncode(StudentModel.toJson(
            id: 0,
            phone: phone,
            email: email,
            password: password,
            address: address,
            fullName: title,
            nationalId: natid
        )
        ),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );
    print('add student status code: ${response.statusCode}');
    print('add student body: ${response.body}');
    return response;
  }
}

