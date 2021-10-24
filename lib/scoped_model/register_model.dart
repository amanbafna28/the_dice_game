import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:the_dice_game/constants/app_constants.dart';
import 'package:the_dice_game/firebase/firebase_utility.dart';
import 'package:the_dice_game/models/user_info.dart';
import 'package:the_dice_game/screens/onboarding_screen.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

class RegisterModel extends Model {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String errorText;

  registerUser(context) {
    if (GlobalUtils.getTextFromController(userNameController).isEmpty) {
      setErrorText('Username is empty');
    } else if (GlobalUtils.getTextFromController(passwordController).isEmpty) {
      setErrorText('Password is empty');
    } else if (GlobalUtils.getTextFromController(confirmPasswordController)
        .isEmpty) {
      setErrorText('Confirm Password is empty');
    } else if (GlobalUtils.getTextFromController(userNameController).length <
        8) {
      setErrorText('Please enter 8 or more\ncharacters for username');
    } else if (GlobalUtils.getTextFromController(passwordController).length <
        8) {
      setErrorText('Please enter 8 or more\ncharacters for password');
    } else if (GlobalUtils.getTextFromController(confirmPasswordController)
            .length <
        8) {
      setErrorText('Please enter 8 or more\ncharacters for confirm password');
    } else if (GlobalUtils.getTextFromController(passwordController) !=
        GlobalUtils.getTextFromController(confirmPasswordController)) {
      setErrorText('Passwords don\'t match.');
    } else {
      setErrorText(null);
      FirebaseUtility.addUser(
        info: UserInfo(
          username: GlobalUtils.getTextFromController(userNameController),
          password: GlobalUtils.getTextFromController(passwordController),
        ),
      ).whenComplete(() {
        Constants.preferences.setBool(Constants.isUserLoggedIn, true);
        Constants.preferences.setString(
          Constants.userName,
          GlobalUtils.getTextFromController(userNameController),
        );
        GlobalUtils.navigateAndRemoveUntil(
          context: context,
          screen: OnboardingScreen(),
        );
      });
    }
  }

  setErrorText(String error) {
    errorText = error;
    notifyListeners();
  }
}
