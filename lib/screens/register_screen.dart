import 'package:flutter/material.dart';
import 'package:the_dice_game/constants/export_constants.dart';
import 'package:the_dice_game/screens/home_screen.dart';
import 'package:the_dice_game/screens/login_screen.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthCommonWidget(
      title: AppStrings.register,
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
          CustomTextField(
            hintText: AppStrings.confirmPassword,
            controller: TextEditingController(),
          ),
          SizedBox(
            height: SizeConfig.deviceHeight * 2,
          ),
          CustomRoundedButton(
            label: AppStrings.register,
            onPressed: ()=>GlobalUtils.navigateAndRemoveUntil(
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
              screen: LoginScreen(),
            ),
            label: AppStrings.alreadyRegisteredLoginHere,
          )
        ],
      ),
    );
  }
}
