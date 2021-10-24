import 'package:flutter/material.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

class AppTextStyles {
  static TextStyle smallTextStyle =
      TextStyle(fontSize: SizeConfig.deviceHeight * 1.75);

  static TextStyle mediumTextStyle =
      TextStyle(fontSize: SizeConfig.deviceHeight * 2);

  static TextStyle largeTextStyle =
      TextStyle(fontSize: SizeConfig.deviceHeight * 2.25);

  static TextStyle boldTextStyle = TextStyle(
    fontSize: SizeConfig.deviceHeight * 2,
    fontWeight: FontWeight.bold,
  );
}
