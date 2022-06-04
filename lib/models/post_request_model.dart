class PostRequest {
  int? id;
  int? bookId;
  int? studentId;

  PostRequest({this.id, this.bookId, this.studentId});


 static Map<String, dynamic> toJson({id, bookId, studentId}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['bookId'] = bookId;
    data['studentId'] = studentId;
    return data;
  }
}