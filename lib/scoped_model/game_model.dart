import 'dart:math';

import 'package:connectivity/connectivity.dart';
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

  bool isPreviousGame;

  GameModel() {
    Future.delayed(Duration(milliseconds: 250), () {
      if (isPreviousGame) {
        points = SharedPreferencesUtility.getInt(Constants.points);
        turns = SharedPreferencesUtility.getInt(Constants.turns);
        number = SharedPreferencesUtility.getInt(Constants.latestNumber);
        notifyListeners();
      }
    });
  }

  roll(context) async {
    int max = 6;
    if (turns < 10) {
      turns++;
      number = Random().nextInt(max) + 1;
      points = points + number;

      SharedPreferencesUtility.setInt(Constants.points, points);
      SharedPreferencesUtility.setInt(Constants.turns, turns);
      SharedPreferencesUtility.setInt(Constants.latestNumber, number);

      SharedPreferencesUtility.setBool(Constants.isGameOver, false);

      notifyListeners();

      if (turns == 10) {
        SharedPreferencesUtility.setBool(Constants.isGameOver, true);

        ConnectivityResult result = await Connectivity().checkConnectivity();

        if (result == ConnectivityResult.none) {
          print('No Internet');
          String cachedUnsavedRecords =
              SharedPreferencesUtility.getData(Constants.unSavedRecords);

          List<GameRecord> unSavedRecords = [];

          if (cachedUnsavedRecords != null) {
            print('1');
            unSavedRecords = gameRecordListFromJson(cachedUnsavedRecords);
            unSavedRecords.add(GameRecord(
                username: SharedPreferencesUtility.getData(Constants.userName),
                gameDate: DateTime.now().toString(),
                points: '$points'));

            SharedPreferencesUtility.setString(
                Constants.unSavedRecords, gameRecordListToJson(unSavedRecords));

            GlobalUtils.navigateAndRemoveUntil(
              context: context,
              screen: HomeScreen(),
            );
          } else {
            print('2');
            unSavedRecords.add(GameRecord(
                username: SharedPreferencesUtility.getData(Constants.userName),
                gameDate: DateTime.now().toString(),
                points: '$points'));

            SharedPreferencesUtility.setString(
                Constants.unSavedRecords, gameRecordListToJson(unSavedRecords));

            GlobalUtils.navigateAndRemoveUntil(
              context: context,
              screen: HomeScreen(),
            );
          }
        } else {
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
}
