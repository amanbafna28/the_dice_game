// To parse this JSON data, do
//
//     final gameRecord = gameRecordFromJson(jsonString);

import 'dart:convert';

GameRecord gameRecordFromJson(String str) =>
    GameRecord.fromJson(json.decode(str));

String gameRecordToJson(GameRecord data) => json.encode(data.toJson());

class GameRecord {
  GameRecord({
    this.username,
    this.points,
    this.gameDate,
  });

  String username;
  String points;
  String gameDate;

  factory GameRecord.fromJson(Map<String, dynamic> json) => GameRecord(
        username: json["username"],
        points: json["points"],
        gameDate: json["gamedate"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "points": points,
        "gamedate": gameDate,
      };
}
