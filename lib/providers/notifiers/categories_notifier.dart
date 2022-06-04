import 'package:flutter/cupertino.dart';
import 'package:signup_demo/models/categories_model.dart';
import 'package:signup_demo/service/category_service.dart';

class CategoryNotifier extends ChangeNotifier{

  List<CategoryModel> categoryList = [];

  getCategories()async
  {
      await CategoryService.getCategory().then((value) {
        categoryList = CategoryModel.getAllCategories(value.body);
        notifyListeners();
      });
  }
  }
