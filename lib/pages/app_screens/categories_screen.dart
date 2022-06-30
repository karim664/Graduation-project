import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/models/categories_model.dart';
import 'package:signup_demo/pages/app_screens/sub_categories_screen.dart';
import 'package:signup_demo/service/category_service.dart';
import '../../providers/notifiers/categories_notifier.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool isCategoriesLoaded = false;
  CategoryService categoryService = CategoryService();

  @override
  void initState() {
    isCategoriesLoaded = false;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isCategoriesLoaded) {
      CategoryNotifier category = Provider.of(context);
      category.getCategories();
      isCategoriesLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    CategoryNotifier category = Provider.of(context);
    if (category.categoryList.isEmpty) {
      return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      );
    }
    return Column(
      children: [
        Expanded(
          child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                  category.categoryList.length,
                  (index) =>
                      list(context, category.categoryList[index], index))),
        ),
      ],
    );
  }

  Widget list(
    context,
    CategoryModel model,
    index,
  ) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SubScreen(categoryModel: model))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(setImage('${model.categoryName}')),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(colors: [
                Color(0xff005F57),
                Color(0xff018A82),
                Color(0xff00B292),
                Color(0xff003E21)
              ], begin: Alignment.topLeft)),
          child: Center(
            child: Text(
              '${model.categoryName}',
              style: TextStyle(
                  fontSize: 30,
                  backgroundColor: const Color(0xFF0E3311).withOpacity(0.5),
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  String setImage(String name) {
    if (name == 'Chemistry' || name == 'chemistry') {
      return 'assets/images/chimst.png';
    } else if (name == 'physics' || name == 'Physics') {
      return 'assets/images/physics.jpg';
    } else if (name == 'Arts' || name == 'arts') {
      return 'assets/images/arts.jpg';
    }

    return 'assets/images/login.jpg';
  }
}
