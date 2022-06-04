import 'dart:convert';

class StudentModel {
  int? id;
  String? fullName;
  String? address;
  String? phone;
  String? nationalId;
  String? password;
  String? email;
  bool? isBlocked;
  bool? isAccepted;

  StudentModel(
      {this.id,
        this.fullName,
        this.address,
        this.phone,
        this.nationalId,
        this.password,
        this.email,
        this.isBlocked,
        this.isAccepted});

   StudentModel.withId({
    required this.id,
    required this.email,
    required this.password,
    required this.address,
    required this.nationalId,
    required this.phone,
    required this.fullName,
    required this.isAccepted,
    required this.isBlocked,
  });

  StudentModel.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['fullName'];
    address = json['address'];
    phone = json['phone'];
    nationalId = json['nationalId'];
    password = json['password'];
    email = json['email'];
    isBlocked = json['isBlocked'];
    isAccepted = json['isAccepted'];
  }

  static List<StudentModel> getAllStudents(String body)
  {
    List<dynamic> jsonList = jsonDecode(body);
    List<StudentModel>student = [];
    for(int i=0; i<jsonList.length; i++)
      {
        student.add(StudentModel.fromJson(jsonList[i]));
      }
    return student ;
  }

  static StudentModel getStudentById(String body) {
    Map<String, dynamic> studentMap = jsonDecode(body);
    StudentModel s = StudentModel.withId(
      email: studentMap['email'],
      password: studentMap['password'],
      address: studentMap['address'],
      id: studentMap['id'],
      nationalId: studentMap['nationalId'],
      phone: studentMap['phone'],
      fullName: studentMap['fullName'],
      isAccepted: studentMap['isAccepted'],
      isBlocked: studentMap['isBlocked'],
    );

    return s;
  }

  static Map<String, dynamic> toJson(
      {id, fullName, password, address, phone, nationalId, email}) {
     Map<String, dynamic> data = {};
    data['id'] = id;
    data['fullName'] = fullName;
    data['address'] = address;
    data['phone'] = phone;
    data['nationalId'] = nationalId;
    data['password'] = password;
    data['email'] = email;
    return data;
  }
}