import 'package:flutter/material.dart';
import 'package:the_dice_game/app_themes/app_dimensions.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

class GlobalUtils {
  static navigateTo({BuildContext context, Widget screen}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static pushReplace({BuildContext context, Widget screen}) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screen));
  }

  static navigateAndRemoveUntil({BuildContext context, Widget screen}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => screen),
        (Route<dynamic> route) => false);
  }

  static dismissibleDialog(
      {BuildContext context, Widget child, double dialogHeight}) async {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) {
          return Builder(
            builder: (context) {
              return Dialog(
                elevation: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.borderRadiusLarge),
                  ),
                  width: SizeConfig.deviceWidth * 100,
                  height: dialogHeight ?? SizeConfig.deviceHeight * 50,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.deviceHeight * 1,
                        horizontal:
                            AppDimensions.standardHorizontalSmallPadding),
                    child: child,
                  ),
                ),
              );
            },
          );
        });
  }
}
