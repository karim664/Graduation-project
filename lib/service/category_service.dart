import 'package:http/http.dart' as http;
import 'package:signup_demo/models/categories_model.dart';

class CategoryService{
 static List<CategoryModel> category =[];
  CategoryModel catmodel = CategoryModel();

 static Future<http.Response> getCategory()async
  {
    Uri url = Uri.parse(
        'https://libraryapiapp.azurewebsites.net/api/Category');
    http.Response response = await http.get(
      url,
    );
 print('get Categories status code: ${response.statusCode}');
 return response;
  } 
}