import 'package:flutter/cupertino.dart';
import 'package:signup_demo/models/subcategory_model.dart';
import 'package:signup_demo/service/subcategory_service.dart';

class SubCategoriesNotifier extends ChangeNotifier{
  List<SubCategoryModel> subCategoriesList = [];
  getSubCategoriesByMainId(int id)async
  {
    subCategoriesList = [];
  await SubCategoryService.getSubByMainId(id).then((value)
    {
      subCategoriesList = SubCategoryModel.getSubCategoriesById(value.body);
    });
    notifyListeners();
  }
}