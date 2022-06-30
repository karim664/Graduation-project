import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signup_demo/service/student_services.dart';
import 'package:http/http.dart' as http;
import '../../models/student_model.dart';

class StudentNotifier extends ChangeNotifier {
  List<StudentModel> student = [];
  StudentModel? studentByID = StudentModel();

  getStudents() async {
    if (student.isEmpty) {
      await StudentService.getStudent().then((value) {
        student = StudentModel.getAllStudents(value.body);
      });
      notifyListeners();
    }
  }

  getStudentById(id) async {
    if (studentByID == null) {
      await StudentService.getStudentById(id).then((value) {
        studentByID = StudentModel.getStudentById(value.body);
      });
      notifyListeners();
    }
  }

  Future<http.Response> postStudent(
      title, phone, password, natid, email, address) async {
    http.Response response = await StudentService.addStudent(
      title: title,
      phone: phone,
      password: password,
      natid: natid,
      email: email,
      address: address,
    ).then((value) {
      return value;
    });
    notifyListeners();
    return response;
  }
}
