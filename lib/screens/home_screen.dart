import 'package:flutter/material.dart';
import 'package:the_dice_game/app_themes/export_themes.dart';
import 'package:the_dice_game/constants/app_strings.dart';
import 'package:the_dice_game/constants/export_constants.dart';
import 'package:the_dice_game/screens/game_screen.dart';
import 'package:the_dice_game/screens/onboarding_screen.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';
import 'package:the_dice_game/utilities/shared_prefs_utility.dart';

class HomeScreen extends StatelessWidget {
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
                    'Hello,\n${SharedPreferencesUtility.getData(Constants.userName)}',
                    style: AppTextStyles.boldTextStyle.copyWith(
                      fontSize: SizeConfig.deviceHeight * 1.75,
                    ),
                  ),
                  Text(
                    '${AppStrings.appVersion}\n1.0.1',
                    style: AppTextStyles.boldTextStyle.copyWith(
                      fontSize: SizeConfig.deviceHeight * 1.75,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.deviceHeight * 20,
            ),
            SharedPreferencesUtility.getBool(Constants.isGameOver)
                ? SizedBox.shrink()
                : CustomRoundedButton(
                    label: AppStrings.continueOld,
                  ),
            CustomRoundedButton(
              label: AppStrings.newGame,
              onPressed: () {
                if (SharedPreferencesUtility.getBool(Constants.isGameOver)) {
                  GlobalUtils.navigateAndRemoveUntil(
                    context: context,
                    screen: GameScreen(),
                  );
                } else {
                  GlobalUtils.dismissibleDialog(
                    context: context,
                    dialogHeight: SizeConfig.deviceHeight * 40,
                    child: NewGameDialog(),
                  );
                }
              },
            ),
            CustomRoundedButton(
              label: AppStrings.leaderboards,
            ),
            CustomRoundedButton(
              label: AppStrings.logout,
              onPressed: () {
                SharedPreferencesUtility.clear();
                GlobalUtils.navigateAndRemoveUntil(
                    context: context, screen: OnboardingScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NewGameDialog extends StatelessWidget {
  const NewGameDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          AppStrings.areYouSure2,
          style: AppTextStyles.smallTextStyle,
          textAlign: TextAlign.center,
        ),
        Column(
          children: [
            DialogButton(
              label: AppStrings.yes,
              onPressed: () {
                SharedPreferencesUtility.setBool(Constants.isGameOver, true);
                GlobalUtils.navigateAndRemoveUntil(
                  context: context,
                  screen: GameScreen(),
                );
              },
            ),
            DialogButton(
              label: AppStrings.no,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ],
    );
  }
}
