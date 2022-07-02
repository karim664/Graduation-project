import 'package:http/http.dart' as http;

class FavoritesServices
{
  static Future<http.Response>getFavorites(studentId)async
  {
    Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/Student/get-favorite-books/$studentId');
    http.Response response = await http.get(url);
    print('get favorites status code: ${response.statusCode}');
    return response;
  }

  static Future<http.Response>postFavorites(studentId, bookId)async
  {
    Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/Student/add-to-favorite/$studentId/$bookId');
    http.Response response = await http.post(
        url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );
    print('post favorites status code: ${response.statusCode}');
    return response;
  }

  static Future<http.Response> deleteFavorites(studentId, bookId) async
  {
    Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/Student/remove-from-favorite/$studentId/$bookId');
    http.Response response = await http.delete(
        url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );
    print('remove favorites status code: ${response.statusCode}');
    return response;
  }
}