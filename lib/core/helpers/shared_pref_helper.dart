import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // Private constructor to prevent instantiation
  SharedPrefHelper._();

  static Future<void> setData(String key, dynamic value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case const (String):
        await sharedPreferences.setString(key, value);
        break;
      case const (int):
        await sharedPreferences.setInt(key, value);
        break;
      case const (double):
        await sharedPreferences.setDouble(key, value);
        break;
      case const (bool):
        await sharedPreferences.setBool(key, value);
        break;
      default:
        throw ArgumentError("Unsupported value type: ${value.runtimeType}");
    }
  }
  static Future<String> getString(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key)?? '';
  }
  static Future<int> getInt(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key)?? 0;
  }
  static Future<bool> getBoolean(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key)?? false;
  }
  static Future<double> getDouble(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key)?? 0.0;
  }
  static Future<void> removeData(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }
  static Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
