import 'package:flutter/material.dart';
import 'package:the_dice_game/app_themes/export_themes.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

class AuthCommonWidget extends StatelessWidget {
  final String title;
  final Widget bottomWidget;

  const AuthCommonWidget({
    Key key,
    this.title,
    this.bottomWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.deviceHeight * 10,
              ),
              Center(
                child: Text(
                  '$title',
                  style: AppTextStyles.boldTextStyle.copyWith(
                    fontSize: SizeConfig.deviceHeight * 4,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.deviceHeight * 10,
              ),
              bottomWidget
            ],
          ),
        ),
      ),
    );
  }
}
