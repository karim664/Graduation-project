import 'dart:convert';

class FavoritesModel {
  int? bookId;
  String? title;
  int? availableQuantity;
  int? publishedYear;
  String? subCategoryName;
  List<String>? authorsNames;

  FavoritesModel(
      {this.bookId,
        this.title,
        this.availableQuantity,
        this.publishedYear,
        this.subCategoryName,
        this.authorsNames});

  static List<FavoritesModel> getFavorites(body)
  {
    List<dynamic> jsonList = jsonDecode(body);
    List<FavoritesModel> favoritesBooks = [];
    for(int i =0; i<jsonList.length; i++){
      favoritesBooks.add(FavoritesModel.fromJson (jsonList[i]));
    }
    return favoritesBooks;
  }

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    bookId = json['bookId'];
    title = json['title'];
    availableQuantity = json['availableQuantity'];
    publishedYear = json['publishedYear'];
    subCategoryName = json['subCategoryName'];
    authorsNames = json['authorsNames'].cast<String>();
  }

 static Map<String, dynamic> toJson(
      studentId, bookId)
  {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentId '] = studentId;
    data['bookId'] = bookId;
    return data;
  }
}