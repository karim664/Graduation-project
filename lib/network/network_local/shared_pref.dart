import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? sharedpref;

  static init() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  static Future<bool?> setBoolean(String key, value) async {
    return await sharedpref?.setBool(key, value);
  }

  static Future<bool?> setString(String key, value) async{
    return await sharedpref?.setString(key, value);
  }

  static Future<bool?> setList(String key, value) async{
    return await sharedpref?.setStringList(key, value);
  }

  static String? getString(String key)
  {
    return sharedpref?.getString(key);
  }

  static bool? getBoolean(String key) {

    return sharedpref?.getBool(key);
  }

  static List<String>? getList(String key) {

    return sharedpref?.getStringList(key);
  }


}
