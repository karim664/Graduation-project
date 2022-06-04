import 'dart:convert';

class CategoryModel {
  int? categoryId;
  String? categoryName;

  CategoryModel({this.categoryId, this.categoryName});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
  }

 static List<CategoryModel> getAllCategories(String body)
  {
    List<dynamic> jsonList = jsonDecode(body);
    List<CategoryModel> categories = [];
    for(int i=0; i<jsonList.length; i++)
      {
        categories.add(CategoryModel.fromJson(jsonList[i]));
      }
    return categories;
  }

  }
