import 'dart:convert';

class RequestModel {
  int? requestId;
  String? requestDate;
  String? status;
  int? bookId;
  String? bookTitle;
  int? studentId;

  RequestModel(
      {this.requestId,
        this.requestDate,
        this.status,
        this.bookId,
        this.bookTitle,
        this.studentId});

  RequestModel.withId({
    this.requestId,
    this.requestDate,
    this.status,
    this.bookId,
    this.bookTitle,
    this.studentId});

  RequestModel.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    requestDate = json['requestDate'];
    status = json['status'];
    bookId = json['bookId'];
    bookTitle = json['bookTitle'];
    studentId = json['studentId'];
  }

  RequestModel.fromJsonId(Map<String, dynamic> json) {
    requestId = json['requestId'];
    requestDate = json['requestDate'];
    status = json['status'];
    bookId = json['bookId'];
    bookTitle = json['bookTitle'];
    studentId = json['studentId'];
  }

 static List<RequestModel> getAllRequests(String body)
  {
    List<dynamic> jsonList = jsonDecode(body);
    List<RequestModel> data = [];
    for(int i=0; i<jsonList.length; i++)
      {
        data.add(RequestModel.fromJson(jsonList[i]));
      }
    return data;
  }

 static List<RequestModel> getRequestById(String body)
  {
    List<dynamic> jsonList = jsonDecode(body);
    List<RequestModel> data = [];
    for(int i=0; i<jsonList.length; i++)
    {
      data.add(RequestModel.fromJsonId(jsonList[i]));
    }
    return data;
  }

}