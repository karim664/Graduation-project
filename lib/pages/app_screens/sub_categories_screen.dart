import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/models/categories_model.dart';
import 'package:signup_demo/models/subcategory_model.dart';
import 'package:signup_demo/providers/notifiers/subcategory_notifier.dart';

import 'books_from_sub_screen.dart';

class SubScreen extends StatefulWidget {
  CategoryModel categoryModel ;


  SubScreen({Key? key, required this.categoryModel}) : super(key: key);

  @override
  State<SubScreen> createState() => _SubScreenState();
}

class _SubScreenState extends State<SubScreen> {
  bool isSubLoaded = false;

  @override
  void initState() {
    isSubLoaded = false;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isSubLoaded) {
      SubCategoriesNotifier sbuCategories =
          Provider.of<SubCategoriesNotifier>(context);
      sbuCategories.getSubCategoriesByMainId(widget.categoryModel.categoryId!);
      isSubLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context,)
  {
    SubCategoriesNotifier sbuCategories = Provider.of<SubCategoriesNotifier>(context);
    return Scaffold(
           appBar: AppBar(
              title: Text(widget.categoryModel.categoryName!),
      ),
            body: sbuCategories.subCategoriesList.isEmpty
                ?  Center(
                 child: CircularProgressIndicator(color: Theme.of(context).colorScheme.onSecondary),
            )
                : Center(
                  child: ListView.separated(
                    shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return subCategoryItem(sbuCategories: sbuCategories, index: index);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      itemCount: sbuCategories.subCategoriesList.length),
                ),
    );
  }

  Widget subCategoryItem({required SubCategoriesNotifier sbuCategories, index})
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: GestureDetector(
        onTap: ()
        {
          print(
              sbuCategories.subCategoriesList[index].subCategoryId
          );
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  BooksFromSubCategory(
                    subName: sbuCategories.subCategoriesList[index].name!,
                    id: sbuCategories.subCategoriesList[index].subCategoryId,
                  )
              )
          );
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient:  LinearGradient(colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.onSecondary,
              Theme.of(context).colorScheme.secondary,
            ], begin: Alignment.topLeft),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(sbuCategories.subCategoriesList[index].name!)
            ],
          ),
        ),
      ),
    );
  }
}
