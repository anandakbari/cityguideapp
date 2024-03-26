import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }
}

// import 'package:hive/hive.dart';
//
// class PrefUtils {
//   static Box? _box;
//
//   PrefUtils._(); // Private constructor
//
//   static Future<void> init() async {
//     await Hive.init();
//     _box = await Hive.openBox('preferences');
//     print('Hive Initialized');
//   }
//
//   static Future<void> clearPreferencesData() async {
//     await _box?.clear();
//   }
// }