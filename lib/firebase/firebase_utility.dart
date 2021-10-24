import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_dice_game/constants/app_constants.dart';
import 'package:the_dice_game/constants/export_constants.dart';
import 'package:the_dice_game/models/game_record.dart';
import 'package:the_dice_game/models/user_info.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference _userCollection =
    _fireStore.collection(FirebaseStrings.userData);

final CollectionReference _leaderBoardCollection =
    _fireStore.collection(FirebaseStrings.leaderboard);

class FirebaseUtility {
  Future<FirebaseApp> initializeFirebase() async {
    Constants.preferences = await SharedPreferences.getInstance();
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  static Future<void> addUser({@required UserInfo info}) async {
    DocumentReference documentReferencer = _userCollection.doc(info.username);

    await documentReferencer.set(info.toJson()).catchError((e) => print(e));
  }

  static Future<void> addGameRecord({@required GameRecord gameRecord}) async {
    DocumentReference documentReferencer =
        _leaderBoardCollection.doc(gameRecord.gameDate);

    await documentReferencer
        .set(gameRecord.toJson())
        .catchError((e) => print(e));
  }

  static Future<bool> doesUserExist({@required UserInfo info}) async {
    var instance = await _userCollection.doc(info.username).get();
    return instance.exists;
  }

  static Future<bool> isPasswordCorrect(
      {@required UserInfo enteredUser}) async {
    var instance = await _userCollection.doc(enteredUser.username).get();
    UserInfo retrievedUser = UserInfo.fromJson(instance.data());
    return enteredUser.password == retrievedUser.password;
  }

  static Future<UserInfo> getUserDetails(
      {@required UserInfo enteredUser}) async {
    var instance = await _userCollection.doc(enteredUser.username).get();
    UserInfo retrievedUser = UserInfo.fromJson(instance.data());
    return retrievedUser;
  }

  static Future<List<GameRecord>> getLeaderboardRecords() async {
    QuerySnapshot instance = await _leaderBoardCollection.get();
    List<GameRecord> records = [];
    instance.docs.forEach((element) {
      records.add(GameRecord.fromJson(element.data()));
    });
    return records;
  }
}
