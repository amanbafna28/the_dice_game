import 'package:flutter/material.dart';
import 'package:the_dice_game/constants/app_strings.dart';
import 'package:the_dice_game/screens/home_screen.dart';
import 'package:the_dice_game/screens/register_screen.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthCommonWidget(
      title: AppStrings.login,
      bottomWidget: Column(
        children: [
          CustomTextField(
            hintText: AppStrings.enterUserName,
            controller: TextEditingController(),
          ),
          CustomTextField(
            hintText: AppStrings.enterPassword,
            controller: TextEditingController(),
          ),
          SizedBox(
            height: SizeConfig.deviceHeight * 2,
          ),
          CustomRoundedButton(
            label: AppStrings.login,
            onPressed: () => GlobalUtils.navigateAndRemoveUntil(
              context: context,
              screen: AppHomeScreen(),
            ),
          ),
          SizedBox(
            height: SizeConfig.deviceHeight * 10,
          ),
          CustomUnderlineButton(
            onPressed: () => GlobalUtils.pushReplace(
              context: context,
              screen: RegisterScreen(),
            ),
            label: AppStrings.newUserRegisterHere,
          )
        ],
      ),
    );
  }
}
