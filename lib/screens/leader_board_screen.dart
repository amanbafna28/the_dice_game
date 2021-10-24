import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_dice_game/app_themes/export_themes.dart';
import 'package:the_dice_game/constants/app_constants.dart';
import 'package:the_dice_game/constants/app_strings.dart';
import 'package:the_dice_game/firebase/firebase_utility.dart';
import 'package:the_dice_game/models/game_record.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';
import 'package:the_dice_game/utilities/shared_prefs_utility.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<GameRecord> records;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: records == null
            ? Center(
                child: CustomProgressIndicator(),
              )
            : Column(
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
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: records.length,
                      itemBuilder: (_, index) {
                        return TextRowWidget(
                          text1: '${index + 1}',
                          bgColor: AppColors.primaryColor.withOpacity(.2),
                          textColor: Colors.black,
                          text2: records[index].username,
                          text3: records[index].points,
                        );
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Future<void> _getData() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      String cachedRecords =
          SharedPreferencesUtility.getData(Constants.leaderBoardRecords);

      if (cachedRecords == null) {
        records = [];
      } else {
        records = gameRecordListFromJson(cachedRecords);
      }
    } else {
      records = await FirebaseUtility.getLeaderboardRecords();
      SharedPreferencesUtility.setString(
          Constants.leaderBoardRecords, gameRecordListToJson(records));
    }
    records.sort((a, b) => b.points.compareTo(a.points));
    setState(() {});
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
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.deviceHeight * .25,
      ),
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
