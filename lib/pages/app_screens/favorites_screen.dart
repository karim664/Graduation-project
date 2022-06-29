import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/component/local/book.dart';
import 'package:signup_demo/providers/notifiers/favorites_notifier.dart';
import '../../network/network_local/shared_pref.dart';


class Favorites extends StatefulWidget {

  Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}


class _FavoritesState extends State<Favorites> {

  Map logInInfo = jsonDecode(SharedPref.getString('loginUserDetail')!);
  bool isFavoritesLoaded = false;

  @override
  void didChangeDependencies() {
    if(!isFavoritesLoaded) {
      FavoritesNotifier favorites = Provider.of(context);
      favorites.getFavorites(logInInfo['studentId']);
      isFavoritesLoaded = true;
    }
    super.didChangeDependencies();
  }
  @override
  void initState() {
    isFavoritesLoaded = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<FavoritesNotifier>(context);
    return Scaffold(
        body:favorites.favoritesList.isEmpty
            ? Center(
          child: CircularProgressIndicator(
            color:Theme.of(context).colorScheme.onSecondary,
          ),
        ) :GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            childAspectRatio: 1 / 1.04,
            children: List.generate(
              favorites.favoritesList.length,
              (index) => bookItemBuilder(
                context,
                favorites.favoritesList[index],
                index,
              ),
            )));
  }
}
