// To parse this JSON data, do
//
//     final gameRecord = gameRecordFromJson(jsonString);

import 'dart:convert';


List<GameRecord> gameRecordListFromJson(String str) =>
    List<GameRecord>.from(json.decode(str).map((x) => GameRecord.fromJson(x)));

String gameRecordListToJson(List<GameRecord> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
