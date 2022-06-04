import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:signup_demo/models/post_request_model.dart';
import 'package:signup_demo/models/request_model.dart';


class RequestService
{

  static Future<http.Response> getRequests()async
  {
    Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/Request');
    http.Response response = await http.get(url);
    print('get request status code: ${response.statusCode}');
    print(response.body);
    return response;
  }


 static Future<http.Response> getRequestsByNat(natId)async
  {
    Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/Request/get-request-by-national-id/$natId');
    http.Response response = await http.get(url);
    print('get request by id status code: ${response.statusCode}');
    return response;
  }

  static Future<http.Response> cancelRequest(int id)async
  {
    Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/Request/cancel-request/$id');
    http.Response response = await http.put(
        url,
    );
    print('cancel request status code: ${response.statusCode}');
    print(response.body);
    return response;
  }


 static Future<http.Response> postRequest(
      {bookId, studentId})async
  {
    Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/Request');
     http.Response response = await http.post(
        url,
        body:
          jsonEncode(PostRequest.toJson(
            id: 0,
            bookId: bookId,
            studentId: studentId,
          )),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );
    print('post request status code: ${response.statusCode}');
    print(response.body);
     return response ;
  }
}