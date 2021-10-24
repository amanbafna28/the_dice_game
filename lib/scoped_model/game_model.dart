import 'dart:math';

import 'package:scoped_model/scoped_model.dart';
import 'package:the_dice_game/constants/export_constants.dart';
import 'package:the_dice_game/firebase/firebase_utility.dart';
import 'package:the_dice_game/models/game_record.dart';
import 'package:the_dice_game/screens/home_screen.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';
import 'package:the_dice_game/utilities/shared_prefs_utility.dart';

class GameModel extends Model {
  int number;
  int points = 0;
  int turns = 0;

  roll(context) {
    int max = 6;
    if (turns < 10) {
      turns++;
      number = Random().nextInt(max) + 1;
      points = points + number;
      SharedPreferencesUtility.setInt(Constants.points, points);
      SharedPreferencesUtility.setInt(Constants.turns, turns);
      SharedPreferencesUtility.setBool(Constants.isGameOver, false);
      notifyListeners();

      if (turns == 10) {
        SharedPreferencesUtility.setBool(Constants.isGameOver, true);
        FirebaseUtility.addGameRecord(
                gameRecord: GameRecord(
                    username:
                        SharedPreferencesUtility.getData(Constants.userName),
                    gameDate: DateTime.now().toString(),
                    points: '$points'))
            .whenComplete(() {
          GlobalUtils.navigateAndRemoveUntil(
            context: context,
            screen: HomeScreen(),
          );
        });
      }
    }
  }
}
