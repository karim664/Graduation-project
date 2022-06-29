import 'dart:convert';

class BookModel{
  int? bookId;
  String? title;
  int? availableQuantity;
  int? publishedYear;
  String? subCategoryName;
  List<dynamic>? authorsNames;
  bool isFav = false;
  List<dynamic>? studentFavorites;

  BookModel(
      {this.bookId,
      this.title,
      this.availableQuantity,
      this.publishedYear,
      this.subCategoryName,
      this.authorsNames,
      this.studentFavorites});

  BookModel.withId(
      {
       required this.bookId,
       required this.title,
       required this.availableQuantity,
       required this.publishedYear,
       required this.subCategoryName,
       required this.authorsNames,
      });



  BookModel.fromMap(dynamic map){
    title = map['title'];
    bookId = map['bookId'];
    availableQuantity = map['availableQuantity'];
    subCategoryName = map['subCategoryName'];
    publishedYear = map['publishedYear'];
    authorsNames = map['authorsNames'];
    studentFavorites = map['studentFavorites'];

  }

  static List<BookModel> getAllBooksFromJson(String body) {
    List<dynamic> jsonList = jsonDecode(body);
    List<BookModel> books = [];
    for(int i =0; i<jsonList.length; i++){
      books.add(BookModel.fromMap (jsonList[i]));
    }
    return books;
  }

  static BookModel getBookByid(String body)
  {
    Map re = jsonDecode(body);
    BookModel bm = BookModel.withId(
      bookId: re['bookId'],
      title: re['title'],
      authorsNames: re['authorsNames'],
      availableQuantity: re['availableQuantity'] ,
      publishedYear: re['publishedYear'],
      subCategoryName: re['subCategoryName']
    );
    return bm;
  }
}
