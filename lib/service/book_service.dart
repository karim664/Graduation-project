import 'package:http/http.dart' as http;


class BookService
{

 static Future<http.Response> getBooks() async
  {
    Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/Book');
     http.Response response = await http.get(url);
      print('get Books status Code: ${response.statusCode}');
      return response ;
    }

    static Future<http.Response> getBookById(int id)async
    {
      Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/Book/$id');
      http.Response response = await http.get(url);
      print('get Book by id status code: ${response.statusCode}');
      return response;
    }

    static Future<http.Response> getBooksBySubCategoryId({required int subId})async
    {
      Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/SubCategory/get-books-from-sub-category/$subId');
      http.Response response = await http.get(url);
      print('get book by sub id status code: ${response.statusCode}');
      return response;
    }

    static Future<http.Response> getBookCategoryByBookId(int bookId)async
    {
      Uri url = Uri.parse('https://libraryapiapp.azurewebsites.net/api/Book/get-sub-category/$bookId');
      http.Response response = await http.get(url);
      print('get book category by book id status code: ${response.statusCode}');
      return response;
    }

}