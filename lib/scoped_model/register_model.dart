import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:the_dice_game/firebase/firebase_utility.dart';
import 'package:the_dice_game/models/user_info.dart';

class RegisterModel extends Model {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String errorText;

  registerUser(context) {
    if (_getTextFromController(userNameController).isEmpty) {
      setErrorText('Username is empty');
    } else if (_getTextFromController(passwordController).isEmpty) {
      setErrorText('Password is empty');
    } else if (_getTextFromController(confirmPasswordController).isEmpty) {
      setErrorText('Confirm Password is empty');
    } else if (_getTextFromController(userNameController).length < 8) {
      setErrorText('Please enter 8 or more\ncharacters for username');
    } else if (_getTextFromController(passwordController).length < 8) {
      setErrorText('Please enter 8 or more\ncharacters for password');
    } else if (_getTextFromController(confirmPasswordController).length < 8) {
      setErrorText('Please enter 8 or more\ncharacters for confirm password');
    } else if (_getTextFromController(passwordController) !=
        _getTextFromController(confirmPasswordController)) {
      setErrorText('Passwords don\'t match.');
    } else {
      setErrorText(null);
      FirebaseUtility.addItem(
        info: UserInfo(
          username: _getTextFromController(userNameController),
          password: _getTextFromController(passwordController),
        ),
      );
    }
  }

  setErrorText(String error) {
    errorText = error;
    notifyListeners();
  }

  String _getTextFromController(TextEditingController controller) {
    return controller.text.trim();
  }
}
