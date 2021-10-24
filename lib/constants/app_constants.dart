import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static SharedPreferences preferences;

  static const String isUserLoggedIn = 'USER_LOGGED_IN';
  static const String userName = 'USER_NAME';
  static const String points = 'POINTS';
  static const String turns = 'TURNS';
  static const String isGameOver = 'IS_GAME_OVER';
}
