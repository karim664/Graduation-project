import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:signup_demo/service/favorites_services.dart';
import '../../models/book_model.dart';
import '../../network/network_local/shared_pref.dart';
import '../../service/book_service.dart';

class BooksNotifier extends ChangeNotifier{

  List<BookModel> bookList = [];
  List<BookModel> bookListBySubID = [];
  Map bookCategory = {};
  BookModel? bookListById = BookModel();


  getBooks()async
  {
    Map logInInfo = jsonDecode(SharedPref.getString('loginUserDetail')!);
      await BookService.getBooks().then((value) {
        bookList = BookModel.getAllBooksFromJson(value.body);
      });
      await FavoritesServices.getFavorites(logInInfo['studentId']).then((value) =>{

      });
      notifyListeners();

  }

  getBookById(id)async
  {
      await BookService.getBookById(id).then((value)
      {
        bookListById = BookModel.getBookByid(value.body);
      });
      notifyListeners();
  }

  getBooksBySubId(int subId)async
  {
    bookListBySubID = [];
    await BookService.getBooksBySubCategoryId(subId: subId).then((value)
    {
      bookListBySubID = BookModel.getAllBooksFromJson(value.body);
    });
    notifyListeners();
  }

  getBookCategoryByBookId(int bookId)async
  {
    await BookService.getBookCategoryByBookId(bookId).then((value) {
      bookCategory = jsonDecode(value.body);
    });
    notifyListeners();
  }
}
