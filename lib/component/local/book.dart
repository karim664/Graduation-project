import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/models/book_model.dart';
import 'package:signup_demo/network/network_local/shared_pref.dart';
import 'package:signup_demo/providers/notifiers/favorites_notifier.dart';
import '../../pages/app_screens/book_request_screen.dart';



Widget bookItemBuilder(context, BookModel model, index,) {


  var theme = Theme.of(context).textTheme.bodyText1;
  var colorTheme = Theme.of(context).colorScheme;
  FavoritesNotifier favoriteNotifier = Provider.of<FavoritesNotifier>(context, listen: true);

  Map logInInfo = jsonDecode(SharedPref.getString('loginUserDetail')!);
    return GestureDetector(
      onTap:() => Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  BookRequestScreen(model: model,))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
              color:
                colorTheme.primary
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Image(image: AssetImage('assets/images/book.png')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.title}',
                      style: theme,
                    ),
                    const SizedBox(height: 5,
                    ),
                    RichText(
                      maxLines: 1,
                      text: model.authorsNames!.isEmpty
                          ? const TextSpan(
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 11,
                              fontWeight: FontWeight.bold
                          ),
                          text: 'No Author Available'
                      )
                          :  TextSpan(
                          style:  TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,

                          ),
                          text: 'Authors ${model.authorsNames!.join(", ")}'
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: RichText(
                              text: model.availableQuantity != 0
                                  ? TextSpan(

                                  style:  TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                      color: colorTheme.onPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  text:
                                  'Available ${model.availableQuantity.toString()}')
                                  : const TextSpan(
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  text: 'Not Available')),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                              splashColor: Colors.red,
                              splashRadius: 20,
                              onPressed: () {
                                if(model.studentFavorites!.contains(logInInfo['studentId'])){
                                favoriteNotifier.removeFromFavorites(logInInfo['studentId'], model.bookId! , context);
                                }else {
                                  favoriteNotifier.addToFavorites(logInInfo['studentId'], model.bookId! , context);
                                }

                               SnackBar snackBar = SnackBar(
                                  content: Text(model.studentFavorites!.contains(logInInfo['studentId'])
                                      ? 'Removed from favorites'
                                      : 'Added to favorites',
                                  ),
                                  duration: const Duration(milliseconds: 2000) ,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: Icon(Icons.favorite,
                                  color:
                                  model.studentFavorites!.contains(logInInfo['studentId']) ? Colors.red : Colors.white70),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


