import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/models/book_model.dart';
import 'package:signup_demo/providers/notifiers/books_notifier.dart';
import 'package:signup_demo/service/favorites_services.dart';

class FavoritesNotifier extends ChangeNotifier
{
  List<BookModel> favoritesList = [];

  getFavorites(studentId)async
  {
    await FavoritesServices.getFavorites(studentId).then((value)
    {
      favoritesList = BookModel.getAllBooksFromJson(value.body);
      notifyListeners();
      return value.statusCode;
    });

  }

  addToFavorites (int studentId , int bookId ,BuildContext context)async{
    BooksNotifier booksNotifier = Provider.of<BooksNotifier>(context, listen: false);
    booksNotifier.bookList = [];
    await FavoritesServices.postFavorites(studentId, bookId).then((value){
      if (value.statusCode == 200){
        booksNotifier.getBooks();
        notifyListeners();
      }
    });

  }

  removeFromFavorites (int studentId , int bookId , BuildContext context)async{
    BooksNotifier booksNotifier = Provider.of<BooksNotifier>(context, listen: false);
    booksNotifier.bookList = [];
    await FavoritesServices.deleteFavorites(studentId, bookId).then((value){
      if (value.statusCode == 200){
        getFavorites(studentId);
        booksNotifier.getBooks();
        notifyListeners();
      }
    });
  }
}