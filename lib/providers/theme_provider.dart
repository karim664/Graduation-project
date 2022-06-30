import 'package:flutter/cupertino.dart';
import '../network/network_local/shared_pref.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  changeThemeMode() async {
    isDark = !isDark;
    await SharedPref.setBoolean('theme', isDark);
    notifyListeners();
  }

  bool? getThemeMode() {
    bool? themeMode = SharedPref.getBoolean('theme');
    return themeMode;
  }
}
