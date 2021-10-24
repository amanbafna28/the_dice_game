import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_dice_game/app_themes/app_dimensions.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  TextInputType inputType;
  List<TextInputFormatter> formatters;
  int length;

  CustomTextField(
      {this.length,
      this.hintText,
      this.controller,
      this.formatters,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    UnderlineInputBorder disabledBorder() {
      return UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.deviceHeight * 1,
        horizontal: AppDimensions.standardHorizontalPadding,
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        cursorColor: Colors.black,
        maxLength: length,
        inputFormatters: formatters ?? [],
        decoration: InputDecoration(
          counterText: "",
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          enabledBorder: disabledBorder(),
          contentPadding: EdgeInsets.only(
            bottom: SizeConfig.deviceHeight * 0.5,
          ),
          isDense: true,
          disabledBorder: disabledBorder(),
          border: disabledBorder(),
          // hintStyle: hintTextStyle,
          // labelStyle: hintTextStyle,
          // hintText: hintText,
          labelText: hintText,
        ),
      ),
    );
  }
}
