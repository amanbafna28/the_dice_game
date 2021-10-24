import 'package:flutter/material.dart';
import 'package:the_dice_game/app_themes/export_themes.dart';
import 'package:the_dice_game/constants/export_constants.dart';
import 'package:the_dice_game/scoped_model/login_model.dart';
import 'package:the_dice_game/screens/home_screen.dart';
import 'package:the_dice_game/screens/register_screen.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, child, model) {
        return AuthCommonWidget(
          title: AppStrings.login,
          bottomWidget: Column(
            children: [
              CustomTextField(
                hintText: AppStrings.enterUserName,
                controller: model.userNameController,
              ),
              CustomTextField(
                hintText: AppStrings.enterPassword,
                controller: model.passwordController,
              ),
              model.errorText == null || model.errorText.isEmpty
                  ? SizedBox(
                      height: SizeConfig.deviceHeight * 2,
                    )
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.deviceHeight * 1,
                        ),
                        child: Text(
                          model.errorText,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.mediumTextStyle.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
              CustomRoundedButton(
                label: AppStrings.login,
                onPressed: () => model.loginUser(context),
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
      },
    );
  }
}
