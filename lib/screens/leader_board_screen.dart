import 'package:flutter/material.dart';
import 'package:the_dice_game/app_themes/export_themes.dart';
import 'package:the_dice_game/constants/app_strings.dart';
import 'package:the_dice_game/firebase/firebase_utility.dart';
import 'package:the_dice_game/models/game_record.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';

Future<List<GameRecord>> getData() async {
  List<GameRecord> records = await FirebaseUtility.getLeaderboardRecords();
  print(records.length);
  return records;
}

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Text(
                AppStrings.leaderboards,
                style: AppTextStyles.boldTextStyle.copyWith(
                  fontSize: SizeConfig.deviceHeight * 4,
                ),
              ),
            ),
            TextRowWidget(
              text1: AppStrings.srNo,
              text2: AppStrings.name,
              text3: AppStrings.score,
            ),
            Expanded(
              child: FutureBuilder(
                initialData: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        GameRecord record =
                            GameRecord.fromJson(snapshot.data[index]);

                        return TextRowWidget(
                          text1: '${index + 1}',
                          bgColor: AppColors.primaryColor.withOpacity(.25),
                          textColor: Colors.black,
                          text2: record.username,
                          text3: record.points,
                        );
                      },
                    );
                  }
                  return Center(child: CustomProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextRowWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final Color bgColor;
  final Color textColor;

  const TextRowWidget({
    Key key,
    this.text1,
    this.text2,
    this.text3,
    this.bgColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor ?? AppColors.secondaryColor,
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.deviceHeight * 1,
        horizontal: AppDimensions.standardHorizontalSmallPadding,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              text1,
              style: AppTextStyles.smallTextStyle.copyWith(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              text2,
              style: AppTextStyles.smallTextStyle.copyWith(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              text3,
              style: AppTextStyles.smallTextStyle.copyWith(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
