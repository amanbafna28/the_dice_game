import 'package:flutter/material.dart';
import 'package:the_dice_game/app_themes/export_themes.dart';
import 'package:the_dice_game/constants/app_strings.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  AppStrings.leaderboards,
                  style: AppTextStyles.boldTextStyle.copyWith(
                    fontSize: SizeConfig.deviceHeight * 4,
                  ),
                ),
              ),
              Container(
                color: AppColors.secondaryColor,
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.deviceHeight * 1,
                  horizontal: AppDimensions.standardHorizontalSmallPadding,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Sr. no',
                        style: AppTextStyles.smallTextStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        AppStrings.name,
                        style: AppTextStyles.smallTextStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        AppStrings.score,
                        style: AppTextStyles.smallTextStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
