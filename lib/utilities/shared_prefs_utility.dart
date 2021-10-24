import 'package:the_dice_game/constants/app_constants.dart';

class SharedPreferencesUtility {
  Future<void> setData(String key, String value) async {
    Constants.preferences.setString(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    Constants.preferences.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    return Constants.preferences.getBool(key);
  }

  Future<String> getData(String key) async {
    return Constants.preferences.getString(key);
  }

  Future<void> setList(String key, List<String> value) async {
    Constants.preferences.setStringList(key, value);
  }

  Future<List<String>> getList(String key) async {
    return Constants.preferences.getStringList(key);
  }

  Future<void> clear() async {
    Constants.preferences.clear();
  }
}
