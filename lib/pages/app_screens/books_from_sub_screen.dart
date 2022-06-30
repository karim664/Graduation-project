import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/providers/notifiers/subcategory_notifier.dart';
import '../../component/local/book.dart';
import '../../providers/notifiers/books_notifier.dart';

class BooksFromSubCategory extends StatefulWidget {
  String? subName;

  int? id;

  BooksFromSubCategory({Key? key, this.subName, this.id}) : super(key: key);

  @override
  State<BooksFromSubCategory> createState() => _BooksFromSubCategoryState();
}

class _BooksFromSubCategoryState extends State<BooksFromSubCategory> {
  bool isSubLoaded = false;

  @override
  void initState() {
    isSubLoaded = false;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isSubLoaded) {
      BooksNotifier book = Provider.of<BooksNotifier>(context);
      book.getBooksBySubId(widget.id!);
      isSubLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    BooksNotifier books = Provider.of<BooksNotifier>(context);

    if (books.bookList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverAppBar(
          automaticallyImplyLeading: true,
          title: Text(widget.subName!),
          floating: true,
        ),
        SliverGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 1 / 1.04,
          children: List.generate(
              books.bookListBySubID.length,
              (index) => bookItemBuilder(
                    context,
                    books.bookList[index],
                    index,
                  )),
        )
      ]),
    );
  }
}
