import 'package:flutter/cupertino.dart';
import 'package:signup_demo/network/network_local/shared_pref.dart';
import 'package:signup_demo/service/book_service.dart';
import '../models/book_model.dart';
import '../pages/app_screens/categories_screen.dart';
import '../pages/app_screens/favorites_screen.dart';
import '../pages/app_screens/books_screen.dart';

class AppProvider extends ChangeNotifier {
  BookModel book = BookModel();
  BookService bookService = BookService();
  int currentIndex = 0;
  List<bool> isSelected = [false, true];
  bool isDark = true;
  List<BookModel> favBooks = [];
  bool isLogin = false;

  List<Widget> pages = [const Home(), const Categories(), Favorites()];
  List<String> title = [
    'Home',
    'Categories',
    'Favorites',
  ];
  int? myIndex;

  int? getIndex(int index) {
    myIndex = index;
    return myIndex;
  }

  Future getBookId(model) async {
    await BookService.getBookById(model.bookId!);
  }

  void changeFavorites() {
    notifyListeners();
  }

  void addToFavorites(value) {
    favBooks.add(value);
    notifyListeners();
  }

  void removeFromFavorites(value) {
    favBooks.remove(value);
    notifyListeners();
  }

  void botNavChange(index) {
    currentIndex = index;
    notifyListeners();
  }

  void toggleChange(index) {
    for (int i = 0; i < isSelected.length; i++) {
      if (index == i) {
        isSelected[i] = true;
        SharedPref.setBoolean('selected', isSelected[i]);
      } else {
        isSelected[i] = false;
        SharedPref.setBoolean('selected', isSelected[i]);
      }
    }
    notifyListeners();
  }

  void logOutChangeState() {
    isLogin = false;
    SharedPref.setBoolean('login', isLogin);
  }
}
