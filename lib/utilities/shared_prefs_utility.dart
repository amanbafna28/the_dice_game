import 'package:the_dice_game/constants/app_constants.dart';

class SharedPreferencesUtility {
  static setString(String key, String value) {
    Constants.preferences.setString(key, value);
  }

  static setInt(String key, int value) {
    Constants.preferences.setInt(key, value);
  }

  static int getInt(String key) {
    return Constants.preferences.getInt(key);
  }

  static setBool(String key, bool value) {
    Constants.preferences.setBool(key, value);
  }

  static getBool(String key) {
    if (key == Constants.isUserLoggedIn) {
      return Constants.preferences.getBool(key) ?? false;
    } else {
      return Constants.preferences.getBool(key);
    }
  }

  static getData(String key) {
    return Constants.preferences.getString(key);
  }

  static setList(String key, List<String> value) {
    Constants.preferences.setStringList(key, value);
  }

  static getList(String key) {
    return Constants.preferences.getStringList(key);
  }

  static clear() {
    Constants.preferences.clear();
  }
}
