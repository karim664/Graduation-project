import 'package:http/http.dart' as http;

class SubCategoryService {
  static Future<http.Response> getSubByMainId(int mainId) async {
    Uri url = Uri.parse(
        'https://libraryapiapp.azurewebsites.net/api/SubCategory/getSubCategories/$mainId');
    http.Response response = await http.get(url);
    print('get sub categories by main id status code ${response.statusCode}');
    return response;
  }


}
