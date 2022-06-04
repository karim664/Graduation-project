import 'package:flutter/cupertino.dart';
import '../network/network_local/shared_pref.dart';

class SpareProvider extends ChangeNotifier{
  bool isDarkSpare = false;
  void changeThemeMode()async
  {
    await SharedPref.setBoolean('themeSpare', isDarkSpare)
        .then((value) { notifyListeners();});
  }
}