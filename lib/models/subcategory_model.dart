import 'dart:convert';


class SubCategoryModel {
  int? subCategoryId;
  String? name;
  int? categoryId;
  List<dynamic>? books;

  SubCategoryModel({
    this.subCategoryId,
    this.name,
    this.categoryId,
    this.books});

  static List<SubCategoryModel>getSubCategoriesById(String body)
  {
    List<dynamic> jsonData = jsonDecode(body);
    List<SubCategoryModel> subList = [];
    for(int i=0; i<jsonData.length; i++)
      {
        subList.add(SubCategoryModel.fromJson(jsonData[i]));
      }
    return subList;
  }

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['subCategoryId'];
    name = json['name'];
    categoryId = json['mainCategory'];
    books = json['books'];
  }

}
