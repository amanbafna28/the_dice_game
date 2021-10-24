import 'package:flutter/material.dart';
import 'package:the_dice_game/app_themes/export_themes.dart';
import 'package:the_dice_game/constants/app_constants.dart';
import 'package:the_dice_game/constants/app_strings.dart';
import 'package:the_dice_game/firebase/firebase_utility.dart';
import 'package:the_dice_game/models/user_info.dart';
import 'package:the_dice_game/screens/home_screen.dart';
import 'package:the_dice_game/screens/leader_board_screen.dart';
import 'package:the_dice_game/screens/login_screen.dart';
import 'package:the_dice_game/screens/register_screen.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';
import 'package:the_dice_game/utilities/shared_prefs_utility.dart';
import 'package:the_dice_game/utilities/size_config.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isUserLoggedIn;

  @override
  void initState() {
    isUserLoggedIn = SharedPreferencesUtility.getBool(Constants.isUserLoggedIn);
    if (isUserLoggedIn) {
      Future(
        () => GlobalUtils.navigateAndRemoveUntil(
          context: context,
          screen: HomeScreen(),
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return isUserLoggedIn == null
        ? Scaffold(
            body: Center(
              child: CustomProgressIndicator(),
            ),
          )
        : isUserLoggedIn
            ? SizedBox()
            : AuthCommonWidget(
                title: AppStrings.appName,
                bottomWidget: Column(
                  children: [
                    CustomRoundedButton(
                      label: AppStrings.login,
                      onPressed: () => GlobalUtils.navigateTo(
                        context: context,
                        screen: LoginScreen(),
                      ),
                    ),
                    CustomRoundedButton(
                      label: AppStrings.register,
                      onPressed: () => GlobalUtils.navigateTo(
                        context: context,
                        screen: RegisterScreen(),
                      ),
                    ),
                    CustomRoundedButton(
                      label: AppStrings.leaderboards,
                      onPressed: () => GlobalUtils.navigateTo(
                        context: context,
                        screen: LeaderboardScreen(),
                      ),
                    ),
                  ],
                ),
              );
  }

  void _getData() {
    FirebaseUtility.getLeaderboardRecords().then((value) => print(value));
  }
}
