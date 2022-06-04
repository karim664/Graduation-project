import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/component/local/local_com.dart';
import 'package:signup_demo/models/book_model.dart';
import 'package:signup_demo/network/network_local/shared_pref.dart';
import 'package:signup_demo/providers/notifiers/books_notifier.dart';
import 'package:signup_demo/providers/notifiers/request_notifier.dart';


class BookRequestScreen extends StatelessWidget {

  BookModel model;

  var info = jsonDecode(SharedPref.getString('loginUserDetail')!);

  BookRequestScreen({Key? key, required this.model,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return bookRequest(model, context);
  }

  Widget bookRequest(BookModel model, context,)
  {
    RequestNotifier request = Provider.of<RequestNotifier>(context);
    BooksNotifier book = Provider.of<BooksNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text('${model.title}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: double.infinity,
              height: 400,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/login.jpg'),
                      fit: BoxFit.cover
                  ),
              color: Color(0xffd8e6db),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                        'Book Name: ${model.title}',
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).colorScheme.onPrimary
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                        model.authorsNames!.isEmpty? 'No Authors for This Book'
                            :'Authors: ${model.authorsNames!.join(",")}',
                      style: model.authorsNames!.isEmpty? const TextStyle(color: Colors.red)
                      :  TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'PublishedAt:  ${model.publishedYear}',
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.onPrimary
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Category: ${model.subCategoryName}',
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.onPrimary
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                     Text(
                       model.availableQuantity == 0 ? 'Not Available'
                         :'Available: ${model.availableQuantity}',
                       style: model.availableQuantity == 0? const TextStyle(color: Colors.red)
                           :  TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 25
                       ),
                     )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: defaultButton(
                pressed: ()
                {
                  if(model.availableQuantity != 0)
                    {
                      request.postRequest(
                        bookId: model.bookId,
                        studentId: 1,
                      ).then((value)
                      {
                        book.getBooks().then((value){
                          book.getBooks();
                          Navigator.pop(context);
                          SnackBar snackBar =  SnackBar(content: Text('${model.title} Requested Successfully'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      });
                    }
                  else
                  {
                    SnackBar snackBar = const SnackBar(content: Text('The Book is not available 😢'),);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
                ,title:'Request to borrow'
            ),
          ),
        ],
      ),
    );
  }
}
