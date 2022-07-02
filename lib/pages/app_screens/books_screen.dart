import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/component/local/book.dart';
import 'package:signup_demo/pages/app_screens/requests_screen.dart';
import 'package:signup_demo/providers/notifiers/books_notifier.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isBooksLoaded = false;

  @override
  void initState() {
    isBooksLoaded = false;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isBooksLoaded) {
      BooksNotifier books = Provider.of<BooksNotifier>(context);
      books.getBooks();
      isBooksLoaded = true;
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    BooksNotifier books = Provider.of<BooksNotifier>(context);
    if (books.bookList.isEmpty) {
      return Center(
        child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onSecondary),
      );
    }
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverAppBar(
        automaticallyImplyLeading: true,
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RequestsPage()),
                );
              },
              icon: const Icon(Icons.library_books_outlined))
        ],
        floating: true,
      ),
      SliverGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        childAspectRatio: 1 / 1.04,
        children: List.generate(
            books.bookList.length,
            (index) => bookItemBuilder(
                  context,
                  books.bookList[index],
                  index,
                )),
      )
    ]);
  }
}
