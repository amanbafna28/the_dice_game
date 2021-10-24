import 'package:flutter/material.dart';
import 'package:the_dice_game/app_themes/export_themes.dart';
import 'package:the_dice_game/constants/app_strings.dart';
import 'package:the_dice_game/firebase/firebase_utility.dart';
import 'package:the_dice_game/models/user_info.dart';
import 'package:the_dice_game/screens/leader_board_screen.dart';
import 'package:the_dice_game/screens/login_screen.dart';
import 'package:the_dice_game/screens/register_screen.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';
import 'package:the_dice_game/utilities/size_config.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return AuthCommonWidget(
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
}
