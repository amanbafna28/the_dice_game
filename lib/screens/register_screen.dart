import 'package:flutter/material.dart';
import 'package:the_dice_game/app_themes/app_text_styles.dart';
import 'package:the_dice_game/constants/export_constants.dart';
import 'package:the_dice_game/scoped_model/register_model.dart';
import 'package:the_dice_game/screens/home_screen.dart';
import 'package:the_dice_game/screens/login_screen.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterModel>(
      builder: (context, child, model) {
        return AuthCommonWidget(
          title: AppStrings.register,
          bottomWidget: Column(
            children: [
              Center(
                child: Text(
                  'Username and Password should\nhave minimum 8 characters.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.mediumTextStyle,
                ),
              ),
              SizedBox(
                height: SizeConfig.deviceHeight * 5,
              ),
              CustomTextField(
                hintText: AppStrings.enterUserName,
                controller: model.userNameController,
              ),
              CustomTextField(
                hintText: AppStrings.enterPassword,
                controller: model.passwordController,
              ),
              CustomTextField(
                hintText: AppStrings.confirmPassword,
                controller: model.confirmPasswordController,
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
                label: AppStrings.register,
                onPressed: () => model.registerUser(context),
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
      },
    );
  }
}
