import 'package:flutter/material.dart';
import 'package:the_dice_game/app_themes/app_dimensions.dart';
import 'package:the_dice_game/app_themes/app_text_styles.dart';
import 'package:the_dice_game/app_themes/export_themes.dart';
import 'package:the_dice_game/constants/app_strings.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';
import 'package:the_dice_game/utilities/reusable_widgets.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          GlobalUtils.dismissibleDialog(
            context: context,
            dialogHeight: SizeConfig.deviceHeight * 40,
            child: ExitGameDialog(),
          );
          return false;
        },
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: SizeConfig.deviceHeight * 10,
              ),
              Center(
                  child: Text(
                'You have scored X point so far!!',
                style: AppTextStyles.boldTextStyle,
              )),
              SizedBox(
                height: SizeConfig.deviceHeight * 10,
              ),
              DiceWidget(
                number: 6,
              ),
              SizedBox(
                height: SizeConfig.deviceHeight * 10,
              ),
              Center(
                child: Text(
                  '0/10',
                  style: AppTextStyles.boldTextStyle,
                ),
              ),
              SizedBox(
                height: SizeConfig.deviceHeight * 10,
              ),
              CustomRoundedButton(
                label: AppStrings.roll,
                width: SizeConfig.deviceWidth * 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExitGameDialog extends StatelessWidget {
  const ExitGameDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          AppStrings.areYouSure,
          style: AppTextStyles.mediumTextStyle,
        ),
        Column(
          children: [
            DialogButton(
              label: AppStrings.exit,
            ),
            DialogButton(
              label: AppStrings.saveAndExit,
            ),
            DialogButton(
              label: AppStrings.continueText,
            ),

          ],
        ),
      ],
    );
  }
}

class DiceWidget extends StatelessWidget {
  final int number;

  const DiceWidget({
    Key key,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.deviceWidth * 40,
      height: SizeConfig.deviceWidth * 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusLarge),
        border: Border.all(
          color: AppColors.secondaryColor,
          width: 4,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _widgetByNumber(number),
      ),
    );
  }

  Icon _dotWidget() {
    return Icon(
      Icons.brightness_1_rounded,
      color: AppColors.secondaryColor,
      size: SizeConfig.deviceWidth * 5,
    );
  }

  List<Widget> _widgetByNumber(int number) {
    switch (number) {
      case 1:
        return [_dotWidget()];
        break;

      case 2:
        return [_dotWidget(), _dotWidget()];
        break;

      case 3:
        return [_dotWidget(), _dotWidget(), _dotWidget()];
        break;

      case 4:
        return [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _dotWidget(),
              _dotWidget(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _dotWidget(),
              _dotWidget(),
            ],
          ),
        ];
        break;

      case 5:
        return [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _dotWidget(),
              _dotWidget(),
            ],
          ),
          _dotWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _dotWidget(),
              _dotWidget(),
            ],
          ),
        ];
        break;

      case 6:
        return [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _dotWidget(),
              _dotWidget(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _dotWidget(),
              _dotWidget(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _dotWidget(),
              _dotWidget(),
            ],
          ),
        ];
        break;
    }
  }
}
