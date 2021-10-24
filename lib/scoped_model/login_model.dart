import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:the_dice_game/constants/export_constants.dart';
import 'package:the_dice_game/firebase/firebase_utility.dart';
import 'package:the_dice_game/models/user_info.dart';
import 'package:the_dice_game/screens/onboarding_screen.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

class LoginModel extends Model {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String errorText;

  loginUser(BuildContext context) async {
    bool isPasswordCorrect;
    UserInfo userInfo = UserInfo(
      username: GlobalUtils.getTextFromController(userNameController),
      password: GlobalUtils.getTextFromController(passwordController),
    );

    bool doesUserExist = await FirebaseUtility.doesUserExist(info: userInfo);

    if (doesUserExist) {
      isPasswordCorrect =
          await FirebaseUtility.isPasswordCorrect(enteredUser: userInfo);
    }

    if (GlobalUtils.getTextFromController(userNameController).isEmpty) {
      setErrorText('Username is empty');
    } else if (GlobalUtils.getTextFromController(passwordController).isEmpty) {
      setErrorText('Password is empty');
    } else if (GlobalUtils.getTextFromController(userNameController).length <
        8) {
      setErrorText('User not found.');
    } else if (GlobalUtils.getTextFromController(passwordController).length <
        8) {
      setErrorText('Incorrect password');
    } else if (!doesUserExist) {
      setErrorText('User not found.');
    } else if (!isPasswordCorrect) {
      setErrorText('Incorrect password.');
    } else {
      Constants.preferences.setBool(Constants.isUserLoggedIn, true);
      Constants.preferences.setString(
        Constants.userName,
        GlobalUtils.getTextFromController(userNameController),
      );
      GlobalUtils.navigateAndRemoveUntil(
        context: context,
        screen: OnboardingScreen(),
      );
    }
  }

  setErrorText(String error) {
    errorText = error;
    notifyListeners();
  }
}
