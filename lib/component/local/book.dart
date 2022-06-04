import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/models/book_model.dart';
import 'package:signup_demo/network/network_local/shared_pref.dart';
import 'package:signup_demo/providers/AppProvider_provider.dart';
import '../../pages/app_screens/book_screen.dart';



Widget bookItemBuilder(context, BookModel model, index,) {


  var theme = Theme.of(context).textTheme.bodyText1;
  var colorTheme = Theme.of(context).colorScheme;
  AppProvider p = Provider.of<AppProvider>(context);



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
                        RichText(
                            text: model.availableQuantity != 0
                                ? TextSpan(
                                style:  TextStyle(
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
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                              splashColor: Colors.red,
                              splashRadius: 20,
                              onPressed: () {
                                model.isFav = !model.isFav ;
                                if (model.isFav) {
                                  p.addToFavorites(model);
                                } else {
                                  SharedPref.setBoolean('favs', true);
                                  p.removeFromFavorites(model);
                                }
                                SnackBar snackBar = SnackBar(
                                  content: Text(model.isFav == true
                                      ? 'Added to favorites'
                                      : 'Removed from favorites'),
                                  duration: const Duration(milliseconds: 500) ,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: Icon(Icons.favorite,
                                  color:
                                  model.isFav  ? Colors.red : Colors.white70),
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


