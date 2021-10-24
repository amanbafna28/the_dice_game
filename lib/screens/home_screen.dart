import 'package:flutter/material.dart';
import 'package:the_dice_game/app_themes/export_themes.dart';
import 'package:the_dice_game/constants/app_strings.dart';
import 'package:the_dice_game/screens/game_screen.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

class AppHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.standardHorizontalPadding,
                  vertical: SizeConfig.deviceHeight * 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello,\nX',
                    style: AppTextStyles.boldTextStyle,
                  ),
                  Text(
                    '${AppStrings.appVersion}\n1.0.1',
                    style: AppTextStyles.boldTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.deviceHeight*20,),
            CustomRoundedButton(
              label: AppStrings.continueOld,
            ),

            CustomRoundedButton(
             label: AppStrings.newGame,
              onPressed: ()=>GlobalUtils.navigateTo(
                context: context,
                screen: GameScreen()
              ),
           ),
            CustomRoundedButton(
              label: AppStrings.leaderboards,
            ),
            CustomRoundedButton(
              label: AppStrings.logout,
            ),
          ],
        ),
      ),
    );
  }
}
