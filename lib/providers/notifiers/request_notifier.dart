import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:signup_demo/models/request_model.dart';
import 'package:signup_demo/service/requests_services.dart';

class RequestNotifier extends ChangeNotifier
{
  List<RequestModel> requests = [];
  List<RequestModel> requestsByNatId = [];

  getRequests()async {

        await RequestService.getRequests().then((value) {
        requests = RequestModel.getAllRequests(value.body);
      });

  }

  getRequestsByNatId(natId)async
  {
    await RequestService.getRequestsByNat(natId).then((value)
      {
        requestsByNatId = RequestModel.getRequestById(value.body);
        notifyListeners();
      });
  }

  Future<http.Response> postRequest({studentId, bookId})async {
   http.Response response = await RequestService.postRequest(
        studentId: studentId,
        bookId: bookId
    ).then((value) {
      return value ;
    });
   notifyListeners();
   return response ;
  }

  Future cancelRequest(int id)async{
   await RequestService.cancelRequest(id);
   notifyListeners();
  }
}