import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_dice_game/constants/app_constants.dart';
import 'package:the_dice_game/constants/export_constants.dart';
import 'package:the_dice_game/models/user_info.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference _userCollection =
    _fireStore.collection(FirebaseStrings.userData);

class FirebaseUtility {
  Future<FirebaseApp> initializeFirebase() async {
    Constants.preferences = await SharedPreferences.getInstance();
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  static Future<void> addItem({@required UserInfo info}) async {
    DocumentReference documentReferencer = _userCollection.doc(info.username);

    await documentReferencer
        .set(info.toJson())
        .whenComplete(() => print("Added user to DB"))
        .catchError((e) => print(e));
  }
}
