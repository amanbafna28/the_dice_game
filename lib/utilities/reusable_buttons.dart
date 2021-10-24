import 'package:flutter/material.dart';
import 'package:the_dice_game/app_themes/export_themes.dart';
import 'package:the_dice_game/constants/export_constants.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

class CustomRoundedButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomRoundedButton({
    Key key,
    this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(
          vertical: SizeConfig.deviceHeight * 1,
          horizontal: AppDimensions.standardHorizontalPadding,
        ),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.deviceHeight * 2,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(
            AppDimensions.borderRadiusLarge,
          ),
        ),
        child: Text(
          '$label',
          style: AppTextStyles.largeTextStyle.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomUnderlineButton extends StatelessWidget {
  String label;
  Function onPressed;
  Color textColor;

  CustomUnderlineButton({this.onPressed, this.label, this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        '$label',
        style: AppTextStyles.mediumTextStyle.copyWith(
          color: textColor ?? AppColors.secondaryColor,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
